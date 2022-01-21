Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E123EC433EF
	for <rust-for-linux@archiver.kernel.org>; Fri, 21 Jan 2022 16:49:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351243AbiAUQtV (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 21 Jan 2022 11:49:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349221AbiAUQtT (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 21 Jan 2022 11:49:19 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3486C06173B
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Jan 2022 08:49:18 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id j85so10551500qke.2
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Jan 2022 08:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:from
         :subject:content-transfer-encoding;
        bh=+fuxWh9ZtbIsGut2GE+G/I5xZUTMJg9kixnkh23sqiw=;
        b=Zx5Wk4IyYJLYOu7BRwtoG9WqTJoEl8ylmtnAtPrcJ3vzeNJatgg7GIfociDR9eHwrG
         Lw+rxbBTBozQ4kukFF/BCMfMe0jLZyIkXsvpBP5P39LMEsJa66SgmxoEHCLJzgrXHlig
         YJ46jd7xNyYvhvZ1PVakeyozqOwbyi0GtZyhrx2MlsysjSiTU/KUqngRyroUCtf+4pqP
         GsIPKLOD1IF6bDrHYg2NJF9duLWI8CzUPF36Y3KHRIancgQfr1oia1NRo+InRCcgAib9
         UNAnbQaG77TuJCIddnTmkHdBSIcijp/dsZS7QSWRJFfptHTAovUAP7T+FrVOqj9p0ZJp
         Vmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:content-transfer-encoding;
        bh=+fuxWh9ZtbIsGut2GE+G/I5xZUTMJg9kixnkh23sqiw=;
        b=PREuZLtzZhwXnd5xgcphdMwZfrxwhzpIoRV9z990i0IQw24JClo3AHIC5z3QFNsueN
         Y8vLg6Iw/rFegvG1auOvxXVkOu4swIiliAgH/mIOHwMjnfW15JffkaDotALxkFbV7Ljy
         3D+U0ABfR6CpLADC9pUSEBkz8iP0uuXJIKYDkYLedhB7hh8de75I+aQOUGLbdTwJVt+u
         NoKCT61XC0EOjKaISdhcIMccfvfCg7b8Vh/dtIYWY30FqVMFLv2/xdur9hC/FOJNDsKk
         aqEwhhTuwA2yfuhGXE2q/fwaX0xNc4xS6V79NHQy4TD+4mx4GSqz9HtRhMyHZwO84dzb
         IpwQ==
X-Gm-Message-State: AOAM533oQTI41xnGHHk2aJO952bQrda42J9fU3zVOCgsHdXPn4eoLdSB
        DmQUT23Gz0Yr63foAWHr2ii94rZwDxw1RA==
X-Google-Smtp-Source: ABdhPJwUZu+A84NSdSQ3SFjdVd1kJxEzq8YA8AKm3RXOSyvXDdS3xAR3FOD6+5dKuXKcORPS8eRUkg==
X-Received: by 2002:a05:620a:24c2:: with SMTP id m2mr3357557qkn.676.1642783757371;
        Fri, 21 Jan 2022 08:49:17 -0800 (PST)
Received: from [192.168.1.9] (c-73-251-10-33.hsd1.va.comcast.net. [73.251.10.33])
        by smtp.gmail.com with ESMTPSA id z2sm3416770qtj.62.2022.01.21.08.49.16
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jan 2022 08:49:16 -0800 (PST)
Message-ID: <35d69719-2b02-62f2-7e2f-afa367ee684a@gmail.com>
Date:   Fri, 21 Jan 2022 11:49:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To:     rust-for-linux@vger.kernel.org
From:   Austin Chase Minor <austin.chase.m@gmail.com>
Subject: RamFS Port to Rust
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

As part of a class project, Connor Shugg and I (Chase Minor) have ported 
RamFS to Rust for Linux. We hope to contribute our work back to the 
community. We are unsure what of our work is valuable to the community 
in general. We have posted a summary of the work at 
https://austincminor.com/20211030000942-ramfs_rust.html 
<https://austincminor.com/20211030000942-ramfs_rust.html>. This summary 
is included below in plaintext format.

1 Introduction
==============

   RamFS is a Ram-based file system in Linux. It has been self-described
   as a simple file system for learning the minimal implementations
   needed to create a new Linux file system ([link]).

   During the Fall 2021 semester of Advanced Linux Kernel Programming
   with Dr. Changwoo Min at Virginia Tech. [Connor Shugg] and I ([Chase
   Minor]) ported it from kernel C to kernel Rust to learn the process of
   porting something internal to the kernel. We offer our source and
   knowledge here for usage for including or learning from.

   The main contribution of our work is the porting of the RamFS file
   system. However, we also have added various other things to the kernel
   that could be beneficial to other Rust for Linux developers. We will
   focus on discussing these additions below as RamFS itself should be
   fairly self-descriptive. We will try and stay away from miscellaneous
   code changes; however, if there is interest, we can take some time to
   explain those as well.

   Our source code can be found at <https://github.com/acminor/linux 
<https://github.com/acminor/linux>>.


[link]
<https://github.com/torvalds/linux/blob/2c271fe77d52a0555161926c232cd5bc07178b39/fs/ramfs/inode.c#L12 
<https://github.com/torvalds/linux/blob/2c271fe77d52a0555161926c232cd5bc07178b39/fs/ramfs/inode.c#L12>>

[Connor Shugg] <https://github.com/cwshugg>

[Chase Minor] <https://github.com/acminor>


2 RamFS Port
============

   RamFS has been mostly ported to Rust. The only things left to port are
   dependent on macros (`fs_initcall'), functions/types not exported
   using `rust/kernel/bindings_helper.h' (`struct fs_context_operations',
   etc.), and inline function wrappers (`dget'). What is left can be
   found in `fs/ramfs_rust/inode.c'. Other than this, we also did not
   port `file-nommu.c'. Furthermore, we did not change anything related
   to `include/linux/ramfs.h'.


2.1 Process
~~~~~~~~~~~

   In general, our process was to port individual parts of RamFS logic
   incrementally. We accomplished this by adding [cbindgen] to the
   `Makefile.build' rules to generate header files from Rust source code.
   This was to allow us to reference Rust code from C in an automated
   fashion. In this way, we could port a function that has dependencies
   in kernel C to Rust. We would include our generated headers in the C
   file and compile both the C source and Rust source and link them
   together.


[cbindgen] <https://github.com/eqrion/cbindgen 
<https://github.com/eqrion/cbindgen>>


3 Cbindgen Issues
=================

   Cbindgen, in general, is meant to work with Cargo projects. This
   becomes an issue for Rust for Linux which does not use Cargo. We spent
   some time trying to generate the relevant information for cbindgen
   from the kernel build system with no luck. Instead, we currently rely
   on the lack of namespace support in cbindgen ([link]). Using this, we
   can create an internal module with "metatype" information on whether
   an exported type is a struct, enum, or union. This can be seen below.
   As Rust can properly ignore the code while cbindgen cannot, this
   accomplished our goal and allows cbindgen to properly export to
   C-style types with a prefix for the "metatype".

   ,----
   | #[allow(unused)]
   | #[rustfmt::skip]
   | mod __anon__ {
   |     struct user_namespace;
   |     ...
   |     struct fs_parameter_spec;
   | }
   `----


[link]
<https://github.com/eqrion/cbindgen/blob/b94318a8b700d0d94e0da0efe9f2c1bcc27c855f/docs.md#writing-your-c-api 
<https://github.com/eqrion/cbindgen/blob/b94318a8b700d0d94e0da0efe9f2c1bcc27c855f/docs.md#writing-your-c-api>>


4 Sequence Files
================

   In the process of making our code more Rust-like, we noticed that
   `ramfs_show_options' used `seq_printf' ([link]). Currently, to our
   knowledge, Rust for Linux does not have the functionality to handle
   this. However, due to the work of Gary Guo (nbdd0121), Rust for Linux
   does have support for printing Rust-style formatting strings with the
   "%pA" format specifier ([link]). This is used by the `pr_info!' family
   of macros. Taking inspiration from this code, we created a similar
   style macro for sequence file printing (`seq_printf!'). Special care
   had to be taken to ensure that unsafe code blocks are not leaked from
   the macro for the sequence file itself. Regarding the leaking of
   unsafe assumptions to the arguments, this needs to be investigated. I
   believe more work will need to be done concerning this. See my
   comments [here]. You can see an example of using `seq_printf!' below.

   ,----
   | if mode != RAMFS_DEFAULT_MODE {
   |   seq_printf!(unsafe{ m.as_mut().unwrap() }, ",mode={:o}", mode);
   | }
   `----


[link]
<https://github.com/torvalds/linux/blob/2c271fe77d52a0555161926c232cd5bc07178b39/fs/ramfs/inode.c#L181 
<https://github.com/torvalds/linux/blob/2c271fe77d52a0555161926c232cd5bc07178b39/fs/ramfs/inode.c#L181>>

[link]
<https://github.com/Rust-for-Linux/linux/pull/280/commits/9e8bd679ecf29e8d776de322e1685e0db1d5acc0 
<https://github.com/Rust-for-Linux/linux/pull/280/commits/9e8bd679ecf29e8d776de322e1685e0db1d5acc0>>

[here]
<https://github.com/acminor/linux/blob/a8b065ac475219a7f5fc53fafebac33dd5d0123d/rust/kernel/seq_print.rs#L71 
<https://github.com/acminor/linux/blob/a8b065ac475219a7f5fc53fafebac33dd5d0123d/rust/kernel/seq_print.rs#L71>>


5 Compile-time Default C-style Structs
======================================

   In Rust, static data has to be available at compile-time. This can
   result in having to use libraries such as [`lazy_static']. As Rust for
   Linux does not have `lazy_static', we originally manually specified
   each of the unspecified fields in a Rust structure by hand. This is
   because C auto-sets these values to zero when left out while Rust does
   not allow that.

   It would be more Rust-like to implement `Default' for our various
   structures and expand this into the static data using the ".."
   expansion syntax. However, `Default' is not a compile-time expression.
   Thus, it cannot be used for static data.

   It might be tempting to use something like `alloc::alloc_zeroed'. This
   is valid as we can assume all C-style structs are valid if
   zero-initialized (this is how C interprets things). However, this
   function is also not compile-time. We believe we had hit a wall until
   we discovered that both transmuting data and fixed-sized arrays were
   compile-time.

   With this information, we implemented a macro called
   `c_default_struct!' for generating C-style default zeroed structs.
   This currently has to be implemented as a macro. We attempted to make
   this a Rust function; however, as of our last attempt, it appears that
   work on [const-generics] is affecting the ability to do this. In
   regard to implementation, it simply casts a fixed-size array of
   `core::mem::size_of' type bytes and uses `core::mem::transmute' to
   cast this to the final type. An example of using this macro can be
   seen below. This macro can be found [here].

   ,----
   | static ramfs_ops: super_operations = super_operations {
   |   statfs: Some(simple_statfs),
   |   drop_inode: Some(generic_delete_inode),
   |   show_options: Some(ramfs_show_options),
   |   ..c_default_struct!(super_operations)
   | };
   `----


[`lazy_static'] <https://github.com/rust-lang-nursery/lazy-static.rs 
<https://github.com/rust-lang-nursery/lazy-static.rs>>

[const-generics]
<https://rust-lang.github.io/rfcs/2000-const-generics.html 
<https://rust-lang.github.io/rfcs/2000-const-generics.html>>

[here]
<https://github.com/acminor/linux/blob/a8b065ac475219a7f5fc53fafebac33dd5d0123d/rust/kernel/lib.rs#L294 
<https://github.com/acminor/linux/blob/a8b065ac475219a7f5fc53fafebac33dd5d0123d/rust/kernel/lib.rs#L294>>


6 Kbuild Information
====================

   We added options under "File systems" for "Rust Filesystems" where we
   have an option to replace RamFS with the Rust RamFS version.


7 Build Instructions
====================

   Follow the normal [build guide]. Cbindgen should be installed at
   version 0.20.0. Ensure that in `menuconfig', you enable replacing
   RamFS with the Rust version. See the above information on Kbuild.


[build guide]
<https://github.com/Rust-for-Linux/linux/blob/a2a2e1026e73e3c67067320492dd2d8da7cf4b27/Documentation/rust/quick-start.rst 
<https://github.com/Rust-for-Linux/linux/blob/a2a2e1026e73e3c67067320492dd2d8da7cf4b27/Documentation/rust/quick-start.rst>>


8 Future Work
=============

   There is much future work that can be done regarding our work.

   1. It would be prudent (if RamFS Rust was upstreamed) to address the
      proper visibility of the various functions in `inode_rs.rs 
<http://inode_rs.rs>'. They
      should correspond to the original C version (removing pub when the
      original C version was marked as static).
   2. RamFS was updated during our porting process, and we have yet to
      include the updated code.
   3. Rust interfaces for structs such as `super_operations' would be
      nice. One potential option for this is a Trait style interface
      where the different functions could be optionally implemented on a
      type. This would need to be cast-able or binary equivalent to the C
      struct.
   4. Anonymous structs should be properly handled. By default, bindgen
      will give generated names to anonymous structs and unions. This
      could become an issue if the struct is reordered, and it generally
      makes comprehending code difficult. One possible solution to this
      is to conditionally define a macro function to give names to the
      anonymous members when parsed by bindgen but not when compiled
      normally. The issue with this is that Rust code would cause C code
      to be affected by these markings.

   Example of anonymous struct naming.

   ,----
   | S_IFREG => {
   |   inode.i_op = unsafe { &ramfs_file_inode_operations };
   |   inode.__bindgen_anon_3.i_fop = unsafe { &ramfs_file_operations };
   | }
   `----

   Example of conditional naming of anonymous structs in C.
   ,----
   | #ifdef RUST_BINDGEN
   | #define BINDGEN_NAME(NAME) NAME
   | #else
   | #define BIDNGEN_NAME(NAME)
   | #endif
   |
   | struct inode {
   |   union {
   |     const struct file_operations    *i_fop;    /* former 
->i_op->default_file_ops */
   |     void (*free_inode)(struct inode *);
   |   } BINDGEN_NAME(fop_union);
   | };
   `----


9 Miscellaneous
===============

   Our tests for the RamFS Rust file system can be found [here].

   Our project paper with more information can be found [here].
   - Note, the build instructions in this paper may be out of date.


[here] <https://github.com/acminor/ramfs-rust-tests 
<https://github.com/acminor/ramfs-rust-tests>>

[here] <https://austincminor.com/blog-assets/ramfs-rust-report.pdf 
<https://austincminor.com/blog-assets/ramfs-rust-report.pdf>>


All the best,
Chase Minor
austin.chase.m@gmail.com

