import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';








class MovieItem extends StatelessWidget {
   const MovieItem({super.key, required this.rate, required this.year, required this.description, required this.image, required this.title});
 final String image;
   final String title;
  final double rate;
  final int year;
  final String description;
  @override
  Widget build(BuildContext context) {
    return   Padding(

      padding: const EdgeInsets.all( 3.0),

      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(

              width: 120,

              height: 150,

              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(10),

                  image:  DecorationImage(

                      image: NetworkImage(image),

                      fit: BoxFit.cover

                  )

              ),

            ),



            Padding(
              padding: const EdgeInsets.only(top: 10.0,left: 10),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,

                crossAxisAlignment: CrossAxisAlignment.start,

                children:  [

                   SizedBox(
                     width: 230,
                     child: Text(title,style: const TextStyle(fontSize: 18,),

                      maxLines: 1,

                      overflow: TextOverflow.ellipsis,

                                       ),
                   ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      children: [
                        Container(
                          height: 25,
                          width: 55,
                          decoration:  BoxDecoration(
                            color: Colors.red[800],
                            borderRadius: BorderRadius.circular(5),

                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 7.0,top: 3),
                            child: Text('${year}'),
                          ),

                        ),
                        const SizedBox(width: 5,),
                        const Icon(Icons.star,size: 20,color: Colors.amber,),
                        Text('${rate}')
                      ],
                    ),
                  ),

                   SizedBox(
                    width: 230,
                    child: Text(description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:const TextStyle(

                        color: Colors.grey,

                        fontSize: 18,




                        // fontWeight: FontWeight.w600

                      ),

                    ),
                  )

                ],

              ),
            )

          ],

        ),
      ),

    );
  }
}

























