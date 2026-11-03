
import 'package:flutter/material.dart';
import 'package:p5/detailpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController searchController =
      TextEditingController();

  String searchQuery = '';

  final List<Map<String, dynamic>> products = [
    {
      'nama': 'Nasi Goreng',
      'harga': 15000,
      'deskripsi':
          'Nasi goreng khas Indonesia dengan telur, sayuran, dan bumbu rempah yang gurih.',
      'img':
          'https://images.unsplash.com/photo-1603133872878-684f208fb84b?auto=format&fit=crop&w=800&q=80',
    },
    {
      'nama': 'Rice Bowl Sayur',
      'harga': 20000,
      'deskripsi':
          'Nasi dengan aneka sayuran segar, tomat, dan lauk pilihan yang menyehatkan.',
      'img':
          'https://images.unsplash.com/photo-1547592180-85f173990554?auto=format&fit=crop&w=800&q=80',
    },
    {
      'nama': 'Bakso Bakar',
      'harga': 15000,
      'deskripsi':
          'Bakso daging yang dibakar dengan bumbu spesial sehingga memiliki rasa gurih dan sedikit manis.',
      'img':
          'https://images.unsplash.com/photo-1529042410759-befb1204b468?auto=format&fit=crop&w=800&q=80',
    },
    {
      'nama': 'Dimsum',
      'harga': 25000,
      'deskripsi':
          'Dimsum dengan isian daging yang lembut dan disajikan hangat.',
      'img':
          'https://images.unsplash.com/photo-1563245372-f21724e3856d?auto=format&fit=crop&w=800&q=80',
    },
    {
      'nama': 'Ramen',
      'harga': 22000,
      'deskripsi':
          'Mie ramen dengan kuah gurih, telur, dan aneka topping yang lezat.',
      'img':
          'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?auto=format&fit=crop&w=800&q=80',
    },
    {
      'nama': 'Pizza',
      'harga': 30000,
      'deskripsi':
          'Pizza dengan topping keju, saus tomat, dan aneka bahan pilihan.',
      'img':
          'https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=800&q=80',
    },
    {
      'nama': 'Beef Burger',
      'harga': 25000,
      'deskripsi':
          'Burger dengan daging sapi, selada, keju, dan saus spesial di dalam roti lembut.',
      'img':
          'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=800&q=80',
    },
    {
      'nama': 'Sushi',
      'harga': 28000,
      'deskripsi':
          'Sushi khas Jepang dengan nasi, nori, dan isian pilihan yang segar.',
      'img':
          'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?auto=format&fit=crop&w=800&q=80',
    },
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products.where((product) {
      final nama = product['nama'].toString().toLowerCase();
      final deskripsi =
          product['deskripsi'].toString().toLowerCase();
      final query = searchQuery.toLowerCase();

      return nama.contains(query) || deskripsi.contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),

      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // HEADER
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.fromLTRB(
                    20, 25, 20, 25),
                decoration: const BoxDecoration(
                  color: Color(0xFFE97835),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.restaurant_menu,
                          color: Colors.white,
                          size: 28,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Foodie',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      'Selamat Datang!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      'Temukan makanan favoritmu hari ini.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 18),

                    // SEARCH BAR
                    TextField(
                      controller: searchController,
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },

                      decoration: InputDecoration(
                        hintText: 'Cari makanan favorit...',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),

                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color(0xFFE97835),
                        ),

                        suffixIcon: searchQuery.isNotEmpty
                            ? IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    searchController.clear();
                                    searchQuery = '';
                                  });
                                },
                              )
                            : null,

                        filled: true,
                        fillColor: Colors.white,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),

                        contentPadding:
                            const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // JUDUL MENU
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                    20, 25, 20, 15),

                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      searchQuery.isEmpty
                          ? 'Menu Makanan'
                          : 'Hasil Pencarian',
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF493226),
                      ),
                    ),

                    Text(
                      '${filteredProducts.length} Menu',
                      style: const TextStyle(
                        color: Color(0xFFE97835),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // GRID PRODUK
            if (filteredProducts.isNotEmpty)
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16),

                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final product = filteredProducts[index];

                      return InkWell(
                        borderRadius: BorderRadius.circular(18),

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Detailpage(
                                nama: product['nama'],
                                harga: product['harga'],
                                img: product['img'],
                                deskripsi: product['deskripsi'],
                              ),
                            ),
                          );
                        },

                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(18),

                            boxShadow: [
                              BoxShadow(
                                color:
                                    Colors.brown.withOpacity(0.08),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),

                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [
                              // GAMBAR
                              Expanded(
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          const BorderRadius.vertical(
                                        top: Radius.circular(18),
                                      ),

                                      child: Image.network(
                                        product['img'],
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,

                                        errorBuilder: (context,
                                            error, stackTrace) {
                                          return Container(
                                            color: const Color(
                                                0xFFF3E5D8),
                                            child: const Center(
                                              child: Icon(
                                                Icons.restaurant,
                                                size: 45,
                                                color: Color(
                                                    0xFFE97835),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),

                                    // IKON FAVORIT
                                    Positioned(
                                      top: 10,
                                      right: 10,

                                      child: Container(
                                        padding:
                                            const EdgeInsets.all(7),

                                        decoration:
                                            const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),

                                        child: const Icon(
                                          Icons.favorite_border,
                                          color: Color(0xFFE97835),
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // INFORMASI PRODUK
                              Padding(
                                padding:
                                    const EdgeInsets.all(12),

                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      product['nama'],
                                      maxLines: 1,
                                      overflow:
                                          TextOverflow.ellipsis,

                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF493226),
                                      ),
                                    ),

                                    const SizedBox(height: 6),

                                    Text(
                                      'Rp ${product['harga']}',

                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFFE97835),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    const Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 16,
                                          color: Colors.orange,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          'Menu Favorit',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 13,
                                          color: Color(0xFFE97835),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },

                    childCount: filteredProducts.length,
                  ),

                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 15,
                    mainAxisExtent: 245,
                  ),
                ),
              )

            // JIKA PRODUK TIDAK DITEMUKAN
            else
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(35),

                  child: Column(
                    children: [
                      const Icon(
                        Icons.search_off,
                        size: 65,
                        color: Color(0xFFE97835),
                      ),

                      const SizedBox(height: 15),

                      const Text(
                        'Makanan tidak ditemukan',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF493226),
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Coba cari dengan nama makanan lain.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 25),
            ),
          ],
        ),
      ),
    );
  }
}
