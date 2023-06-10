Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAF5C7EE2E
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 09:15:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234578AbjFJJPx (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 05:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234557AbjFJJPL (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 05:15:11 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3EBF3C0E
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 02:14:30 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5149390b20aso4400270a12.3
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 02:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20221208.gappssmtp.com; s=20221208; t=1686388457; x=1688980457;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOVUob5HQN97jfgNIXoEC9umnKzhXdMXVJu5n8kDPg8=;
        b=WL3Lxro7AT9UfNZhSk/rjK11C05nATklN8FZ4FFPEAlv1NG6dEA5pYr2YBVaxyBkd1
         If8rJOZZEEO+tbHLm3ekRpIchFXm+8HL9ucopQbSeQYP+mZLcwopCkhsEzqOk5PdpAfR
         bVqNH2JcoEwUNJWFwHNsIrFnp47r8B3YhO5I5A4ZX8HqOrgK7Fwv6xTkBdCI4D64G/Pj
         FD6bzbd8jKgtNNuNohUjeTAhZNh/nYznb7i68Hstvwb6zmGVMNulbkpqDZeNZYXPDTZq
         6+h2bbTzBdIiR2w4qhb85PC00ETLvm+bwrYwyqHTQAnf2g0WKvbFAjVMHHhVKAzZ/3fl
         N8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686388457; x=1688980457;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tOVUob5HQN97jfgNIXoEC9umnKzhXdMXVJu5n8kDPg8=;
        b=Gkup+AUXjny8ynVKgXq8OlurEyvdWuLyoCrQ1RUyOgyFInYiTyjSGueNxsyGU8tmN5
         0PqiZ+IqT2K2f1WgiSpm2OeWpAD2oTGnqvX/68fgcGTPCcJ/4LLbu53gMiCQjip5/1aY
         24oGwj3CaDwgAhjczfFgKizh9Ewz0T5BA5MlrIVI/9Up9RBMWVoPmabbD+n2veaZ1+sv
         fAzhVqlHyKrMyrrTVqijdw4Xq+P4O6gulbpfrU0uEwLDU+hvTpvVIoltZ30a4a0Mmws1
         U9K0Bzm4mZ6EYYIEp5/DFF94ErI/XpGCgpKG0gWouznW1FMKYHQSQy0HEIk0p7mZeSdw
         /ATQ==
X-Gm-Message-State: AC+VfDxCJ8cdRqLZRXDTlDL6qU9x1g8wwzAQJHB0sk1j295L/yl1VSdN
        eMnuX339wRePl3jgiTSNgKZkMOhvjGOITn6T2NVZxQ==
X-Google-Smtp-Source: ACHHUZ6Z03TfwehBj1kKiMEYI4mL0+mApWW4fmQ8g70doWR8/0v8LR12PRRCPU5jE5aD1BmQAQHqUA==
X-Received: by 2002:a17:907:3607:b0:973:ff8d:2a46 with SMTP id bk7-20020a170907360700b00973ff8d2a46mr4290061ejc.3.1686388455530;
        Sat, 10 Jun 2023 02:14:15 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id dx15-20020a170906a84f00b0097bb01516c2sm1275056ejb.0.2023.06.10.02.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 02:14:15 -0700 (PDT)
References: <CH0PR11MB5299887C6922D739766FC7A5CD51A@CH0PR11MB5299.namprd11.prod.outlook.com>
User-agent: mu4e 1.10.3; emacs 28.2.50
From:   "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To:     'Miguel Ojeda' <ojeda@kernel.org>
Cc:     "Ariel Miculas (amiculas)" <amiculas@cisco.com>,
        "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [RFC PATCH 00/80] Rust PuzzleFS filesystem driver
Date:   Sat, 10 Jun 2023 11:11:52 +0200
In-reply-to: <CH0PR11MB5299887C6922D739766FC7A5CD51A@CH0PR11MB5299.namprd11.prod.outlook.com>
Message-ID: <87r0qjisrd.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


"Ariel Miculas (amiculas)" <amiculas@cisco.com> writes:

> Some of the patches were bounced by the rust-for-linux mailing list, you =
can see all the commits here:
> https://github.com/Rust-for-Linux/linux/compare/rust-next...ariel-miculas=
:puzzlefs_rfc_v1

This is super annoying when it happens. What is the reason, are they too
large? Miguel: can we do anything about this?

BR Andreas

>
> Regards,
> Ariel
>
>
> From: Ariel Miculas <amiculas@cisco.com>
> Sent: Friday, June 9, 2023 9:29 AM
> To: rust-for-linux@vger.kernel.org <rust-for-linux@vger.kernel.org>
> Cc: Ariel Miculas (amiculas) <amiculas@cisco.com>
> Subject: [RFC PATCH 00/80] Rust PuzzleFS filesystem driver=20
> =C2=A0
> Hi all!
>
> This is a proof of concept driver written for the PuzzleFS
> next-generation container filesystem [1]. I've included a short abstract
> about puzzlefs further below. This driver is based on the rust-next
> branch, on top of which I've backported the filesystem abstractions from
> Wedson Almeida Filho [2][3] and Miguel Ojeda's third-party crates
> support: proc-macro2, quote, syn, serde and serde_derive [4]. I've added
> the additional third-party crates serde_cbor[5] and hex [6]. Then I've
> adapted the user space puzzlefs code [1] so that the puzzlefs kernel
> module could present the directory hierarchy and implement the basic
> read functionality.
> For some additional context, puzzlefs was started by Tycho Andersen and
> it's the successor of atomfs. This FOSDEM presentation from 2019 [12]
> covers the rationale for a new oci image format and presents a higher
> level overview of our goals with puzzlefs.
> I've split the rest of the cover letter in following sections (using a
> markdown style):
> * Example: it describes a practical example of what was achieved
> * Limitations: it presents the existing limitations of this POC
> * Upstreaming steps: it describes the steps needed for upstreaming this
> =C2=A0 driver
> * Setup: it shows how to setup the necessary environment for testing the
> =C2=A0 puzzlefs driver
> * Puzzlefs abstract: it provides a short overview of puzzlefs
>
> # Example
> An example is provided below:
>
> ```
> ~ # cat /proc/filesystems | grep puzzlefs
> nodev=C2=A0=C2=A0 puzzlefs
> ~ # mount -t puzzlefs -o oci_root_dir=3D"/home/puzzlefs_oci" -o image_man=
ifest=3D"2d
> 6602d678140540dc7e96de652a76a8b16e8aca190bae141297bcffdcae901b" none /mnt
> ~ # ls -lR /mnt/
> /mnt/:
> total 0
> drwxr-xr-x=C2=A0=C2=A0=C2=A0 2 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0 Jun=C2=A0 8 12:26 dir-1
> drwxr-xr-x=C2=A0=C2=A0=C2=A0 2 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0 Jun=C2=A0 8 12:26 dir-2
> drwxr-xr-x=C2=A0=C2=A0=C2=A0 2 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0 Jun=C2=A0 8 12:26 dir-3
> drwxr-xr-x=C2=A0=C2=A0=C2=A0 2 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0 Jun=C2=A0 8 12:26 dir-4
> -rw-r--r--=C2=A0=C2=A0=C2=A0 1 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0 Jun=C2=A0 8 12:26 file1
> -rw-r--r--=C2=A0=C2=A0=C2=A0 1 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0 Jun=C2=A0 8 12:26 file2
>
> /mnt/dir-1:
> total 0
>
> /mnt/dir-2:
> total 0
>
> /mnt/dir-3:
> total 0
>
> /mnt/dir-4:
> total 0
> ~ # cat /mnt/file2
> ana are mere bla bla bla
> ~ # wc /mnt/file1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 202=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 20=
2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5454 /mnt/file1
> ```
>
> In this example, /home/puzzlefs_oci is the puzzlefs oci directory:
> ```
> ~ # ls -lR /home/puzzlefs_oci/
> /home/puzzlefs_oci/:
> total 8
> drwxr-xr-x=C2=A0=C2=A0=C2=A0 3 1000=C2=A0=C2=A0=C2=A0=C2=A0 1000=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 Jun=C2=A0=
 8 14:33 blobs
> -rw-r--r--=C2=A0=C2=A0=C2=A0 1 1000=C2=A0=C2=A0=C2=A0=C2=A0 1000=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 266 Jun=C2=A0 8 14:33 i=
ndex.json
> -rw-r--r--=C2=A0=C2=A0=C2=A0 1 1000=C2=A0=C2=A0=C2=A0=C2=A0 1000=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37 Jun=C2=A0 8 14=
:33 oci-layout
>
> /home/puzzlefs_oci/blobs:
> total 0
> drwxr-xr-x=C2=A0=C2=A0=C2=A0 2 1000=C2=A0=C2=A0=C2=A0=C2=A0 1000=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 Jun=C2=A0=
 8 14:33 sha256
>
> /home/puzzlefs_oci/blobs/sha256:
> total 16
> -rw-------=C2=A0=C2=A0=C2=A0 1 1000=C2=A0=C2=A0=C2=A0=C2=A0 1000=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 89 Jun=C2=A0 8 14=
:33 2d6602d678140540dc7e96de652a76a8b16eb
> -rw-------=C2=A0=C2=A0=C2=A0 1 1000=C2=A0=C2=A0=C2=A0=C2=A0 1000=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 925 Jun=C2=A0 8 14:33 4=
df03518eea406343dbb55046720f6a478881
> -rw-------=C2=A0=C2=A0=C2=A0 1 1000=C2=A0=C2=A0=C2=A0=C2=A0 1000=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5479 Jun=C2=A0 8 14:33 d86a87=
b19bd9a2fec0d31687c1d669cdb59eb
> ```
>
> `2d6602d678140540dc7e96de652a76a8b16eb` is the puzzlefs image manifest
> hash for the first_try tag:
> ```
> $ cat /tmp/oci-simple/index.json | jq .
> {
> =C2=A0 "schemaVersion": -1,
> =C2=A0 "manifests": [
> =C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "digest": "sha256:2d6602d678140540dc7e96de=
652a76a8b16e8aca190bae141297bcffdcae901b",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "size": 89,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "media_type": "application/vnd.puzzlefs.im=
age.rootfs.v1",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "annotations": {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "org.opencontainers.image.ref.=
name": "first_try"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0 }
> =C2=A0 ],
> =C2=A0 "annotations": {}
> }
> ```
>
> I will describe how to build a puzzlefs image in the `Setup` section, at
> step 5.
>
> # Limitations
> One limitation is that the puzzlefs driver doesn't implement any lookup
> functionality and instead it inserts every directory entry into the
> dcache during init (see the `DCACHE_BASED` constant). This is similar to
> how the sample `rust_fs` driver works, but the goal is to implement
> proper lookup functions.=C2=A0 However, more filesystem abstractions need=
 to
> be implemented before this can be achieved.
>
> # Upstreaming steps
> Before the puzzlefs driver can be upstreamed, the following need to be
> merged:
> * Wedson's filesystem abstractions [3]
> * the necessary third-party crates [4] (with the preliminary discussion
> about whether this is desirable)
>
> # Setup
> My setup is based on Wedson's tutorial [8]. Next, I will describe the
> necessary steps to build an initrd and run a custom kernel under qemu.
>
> 1. Get the linux rust-next branch [9] and apply this patchset
>
> 2. Follow the rust quickstart guide [10]
>
> 3. configure and build the kernel
> ```
> $ make LLVM=3D1 allnoconfig qemu-busybox-min.config rust.config
> $ make LLVM=3D1 -j$(nproc)
> ```
>
> 4. setup busybox
> ```
> git clone git://git.busybox.net/busybox
> cd busybox
> make menuconfig # enable 'Build static binary' config
> make
> make install
> ```
> This will create the `_install` directory with the rootfs inside it.
>
> 5. create a home directory in the rootfs and copy a puzzlefs oci
> directory in home/puzzlefs_oci
> To create a puzzlefs oci directory:
> * download this custom puzzlefs repository [11] (it's custom because we
> =C2=A0 want to build an image without verity data)
> * run `make release`
> * create a simple filesystem structure with a few directories and files
> =C2=A0 (I've created one at ../test-puzzlefs/simple_rootfs)
> * build a puzzlefs oci image at
> =C2=A0 `~/work/busybox/_install/home/puzzlefs_oci` (replace this path with
> =C2=A0 your busybox path) with the tag `first_try`:
> ```
> $ target/release/puzzlefs build --omit-verity \
> ../test-puzzlefs/simple_rootfs ~/work/busybox/_install/home/puzzlefs_oci \
> first_try
> ```
> * get first_try's image manifest from index.json (inside `puzzlefs_oci`)
> ```
> $ cat index.json | jq . | grep digest
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "digest": "sha256:2d6602d678140540dc7e96de=
652a76a8b16e8aca190bae141297bcffdcae901b",
> ```
>
> 6. add the following 'init' script in the busybox rootfs (rootfs path
> defaults to `./_install'):
> ```
> #!/bin/sh
> mount -t devtmpfs none /dev
> mkdir -p /proc
> mount -t proc none /proc
>
> ifconfig lo up
> udhcpc -i eth0
>
> mkdir /mnt
> mount -t puzzlefs -o oci_root_dir=3D"/home/puzzlefs_oci" -o \
> image_manifest=3D"2d6602d678140540dc7e96de652a76a8b16e8aca190bae141297bcf=
fdcae901b" \
> none /mnt
>
> setsid sh -c 'exec sh -l </dev/ttyS0 >/dev/ttyS0 2>&1'
> ```
>
> Make sure to replace the `image_manifest` with your own digest. This
> init script will be passed to rdinit in the kernel command line.
>
> 7. generate the initramfs
>
> Assuming busybox is in `~/work/busybox`:
> ```
> cd ~/work/busybox/_install && find . | cpio -H newc -o | gzip > ../ramdis=
k.img
> ```
> This will generate a compressed ramdisk image in
> `~/work/busybox/ramdisk.img`.
>
> 8. run with qemu (this assumes the linux tree is at '../linux' and busybox
> is at '../busybox'):
> ```
> qemu-system-x86_64 \
> =C2=A0=C2=A0=C2=A0 -accel kvm \
> =C2=A0=C2=A0=C2=A0 -cpu host \
> =C2=A0=C2=A0=C2=A0 -m 4G \
> =C2=A0=C2=A0=C2=A0 -initrd ../busybox/ramdisk.img \
> =C2=A0=C2=A0=C2=A0 -kernel ../linux/arch/x86/boot/bzImage \
> =C2=A0=C2=A0=C2=A0 -nographic \
> =C2=A0=C2=A0=C2=A0 -append 'console=3DttyS0 nokaslr debug rdinit=3D/init'=
 \
> =C2=A0=C2=A0=C2=A0 -nic user,model=3Drtl8139 \
> =C2=A0=C2=A0=C2=A0 -no-reboot
> ```
>
> 9. Check whether puzzlefs has been successfully mounted
> ```
> ~ # mount | grep puzzlefs
> none on /mnt type puzzlefs (rw,relatime)
> ~ # ls /mnt/
> dir-1=C2=A0 dir-2=C2=A0 dir-3=C2=A0 dir-4=C2=A0 file1=C2=A0 file2
> ```
>
>
> # Puzzlefs abstract
> Puzzlefs [1] is a container filesystem designed to address the
> limitations of the existing OCI format. The main goals of the project
> are reduced duplication, reproducible image builds, direct mounting
> support and memory safety guarantees, some inspired by the OCIv2 design
> document [7].
>
> Reduced duplication is achieved using the content defined chunking
> algorithm FastCDC. This implementation allows chunks to be shared among
> layers. Building a new layer starting from an existing one allows
> reusing most of the chunks.
>
> Another goal of the project is reproducible image builds, which is
> achieved by defining a canonical representation of the image format.
>
> Direct mounting support is a key feature of puzzlefs and, together with
> fs-verity, it provides data integrity. Currently, puzzlefs is
> implemented as a userspace filesystem (FUSE). A read-only kernel
> filesystem driver is underway.
>
> Lastly, memory safety is critical to puzzlefs, leading to the decision
> to implement it in Rust. Another goal is to share the same code between
> user space and kernel space in order to provide one secure
> implementation.
>
>
> [1] https://github.com/anuvu/puzzlefs
> [2] https://github.com/wedsonaf/linux/tree/fs
> [3] https://github.com/Rust-for-Linux/linux/issues/1004
> [4] https://github.com/Rust-for-Linux/linux/pull/1007
> [5] https://docs.rs/serde_cbor/latest/serde_cbor/
> [6] https://docs.rs/hex/0.4.3/hex/
> [7] https://hackmd.io/@cyphar/ociv2-brainstorm
> [8] https://www.youtube.com/watch?v=3DtPs1uRqOnlk
> [9] https://github.com/Rust-for-Linux/linux/tree/rust-next
> [10] https://docs.kernel.org/rust/quick-start.html
> [11] https://github.com/ariel-miculas/puzzlefs/tree/support-no-verity-data
> [12] https://archive.fosdem.org/2019/schedule/event/containers_atomfs/
>
> Ariel Miculas (58):
> =C2=A0 rust: kernel: add libraries required by the filesystem abstractions
> =C2=A0 rust: kernel: backport the delay module from the rust branch
> =C2=A0 rust: kernel: add container_of macro
> =C2=A0 rust: kernel: add offset_of macro
> =C2=A0 drop: Add crate::pr_warn declaration
> =C2=A0 rust: kernel: rename from_kernel_errno to from_errno
> =C2=A0 rust: kernel: Rename from_pointer to from_foreing and into_pointer=
 to
> =C2=A0=C2=A0=C2=A0 into_foreign
> =C2=A0 rust: kernel: add count_paren_items macro, needed by define_fs_par=
ams
> =C2=A0=C2=A0=C2=A0 macro
> =C2=A0 rust: helpers: add missing rust helper 'alloc_pages'
> =C2=A0 kernel: configs: add qemu-busybox-min.config
> =C2=A0 rust: kernel: format the rust code
> =C2=A0 samples: puzzlefs: add initial puzzlefs sample, copied from rust_f=
s.rs
> =C2=A0 kernel: configs: enable rust samples in rust.config
> =C2=A0 Add SAMPLE_RUST_SERDE in rust.config
> =C2=A0 rust: kernel: fix compile errors after rebase to rust-next
> =C2=A0 rust: serde_cbor: import crate
> =C2=A0 rust: serde_cbor: add SPDX License Identifiers
> =C2=A0 rust: serde_cbor: add no_fp_fmt_parse support
> =C2=A0 rust: Kbuild: enable serde_cbor
> =C2=A0 samples: rust: add cbor serialize/deserialize example
> =C2=A0 rust: serde_cbor: add support for serde_cbor's from_slice method by
> =C2=A0=C2=A0=C2=A0 using a custom alloc_kernel feature
> =C2=A0 rust: serde: add support for deserializing Vec with kernel_alloc
> =C2=A0=C2=A0=C2=A0 feature
> =C2=A0 rust: file: Replace UnsafeCell with Opaque for File
> =C2=A0 rust: kernel: implement fmt::Debug for CString
> =C2=A0 samples: puzzlefs: rename RustFs to PuzzleFs
> =C2=A0 samples: puzzlefs: add basic deserializing support for the puzzlefs
> =C2=A0=C2=A0=C2=A0 metadata
> =C2=A0 rust: file: present the filesystem context to the open function
> =C2=A0 rust: kernel: add an abstraction over vfsmount to allow cloning a =
new
> =C2=A0=C2=A0=C2=A0 private mount
> =C2=A0 rust: file: add from_path, from_path_in_root_mnt and read_with_off=
set
> =C2=A0=C2=A0=C2=A0 methods to File
> =C2=A0 samples: puzzlefs: pass the Vfsmount structure from open to read a=
nd
> =C2=A0=C2=A0=C2=A0 return the contents of the data file inside /home/puzz=
lefs_oci
> =C2=A0 rust: file: move from_path, from_path_in_root_mnt and read_with_of=
fset
> =C2=A0=C2=A0=C2=A0 methods to a RegularFile newtype
> =C2=A0 rust: file: ensure RegularFile can only create regular files
> =C2=A0 rust: file: add get_pos method to RegularFile
> =C2=A0 rust: file: add methods read_to_end, get_file_size and update_pos =
to
> =C2=A0=C2=A0=C2=A0 RegularFile
> =C2=A0 rust: file: define a minimal Read trait and implement it for
> =C2=A0=C2=A0=C2=A0 RegularFile
> =C2=A0 samples: puzzlefs: add cbor_get_array_size method
> =C2=A0 samples: puzzlefs: add KernelError to WireFormatError and implement
> =C2=A0=C2=A0=C2=A0 From conversion
> =C2=A0 samples: puzzlefs: implement new for MetadataBlob
> =C2=A0 samples: puzzlefs: build puzzlefs into the kernel, thus avoiding t=
he
> =C2=A0=C2=A0=C2=A0 need to export rust symbols
> =C2=A0 rust: alloc: add try_clone for Vec<T>
> =C2=A0 rust: alloc: add from_iter_fallible for Vec<T>
> =C2=A0 samples: puzzlefs: implement to_errno and from_errno for
> =C2=A0=C2=A0=C2=A0 WireFormatError
> =C2=A0 samples: puzzlefs: add TryReserveError (and from conversion) to
> =C2=A0=C2=A0=C2=A0 WireFormatError
> =C2=A0 samples: puzzlefs: add higher level inode related functionality
> =C2=A0 samples: puzzlefs: populate the directory entries with the inodes =
from
> =C2=A0=C2=A0=C2=A0 the puzzlefs metadata file
> =C2=A0 rust: hex: import crate
> =C2=A0 rust: hex: add SPDX license identifiers
> =C2=A0 rust: Kbuild: enable `hex`
> =C2=A0 rust: hex: implement FromHex trait and hex::decode using a custom
> =C2=A0=C2=A0=C2=A0 kernel_alloc feature
> =C2=A0 rust: hex: add encode_hex_iter and encode_hex_upper_iter methods
> =C2=A0 rust: puzzlefs: add HexError to WireFormatError and implement the =
From
> =C2=A0=C2=A0=C2=A0 conversion
> =C2=A0 rust: puzzlefs: display the error value for
> =C2=A0=C2=A0=C2=A0 WireFormatError::KernelError
> =C2=A0 samples: puzzlefs: add Rootfs and Digest structs to types.rs
> =C2=A0 samples: puzzlefs: implement the conversion from WireFormatError to
> =C2=A0=C2=A0=C2=A0 kernel::error::Error
> =C2=A0 rust: puzzlefs: read the puzzlefs image manifest instead of an
> =C2=A0=C2=A0=C2=A0 individual metadata layer
> =C2=A0 rust: puzzlefs: rename PuzzleFs to PuzzleFsModule to avoid confusi=
on
> =C2=A0=C2=A0=C2=A0 with the PuzzleFS struct
> =C2=A0 rust: puzzlefs: add support for reading files
> =C2=A0 rust: puzzlefs: add oci_root_dir and image_manifest filesystem
> =C2=A0=C2=A0=C2=A0 parameters
>
> Miguel Ojeda (15):
> =C2=A0 rust: proc-macro2: import crate
> =C2=A0 rust: proc-macro2: add SPDX License Identifiers
> =C2=A0 rust: proc-macro2: remove `unicode_ident` dependency
> =C2=A0 rust: quote: import crate
> =C2=A0 rust: quote: add SPDX License Identifiers
> =C2=A0 rust: syn: import crate
> =C2=A0 rust: syn: add SPDX License Identifiers
> =C2=A0 rust: syn: remove `unicode-ident` dependency
> =C2=A0 rust: serde: import crate
> =C2=A0 rust: serde: add `no_fp_fmt_parse` support
> =C2=A0 rust: serde: add SPDX License Identifiers
> =C2=A0 rust: serde_derive: import crate
> =C2=A0 rust: serde_derive: add SPDX License Identifiers
> =C2=A0 rust: Kbuild: enable `proc-macro2`, `quote`, `syn`, `serde` and
> =C2=A0=C2=A0=C2=A0 `serde_derive`
> =C2=A0 rust: test `serde` support
>
> Wedson Almeida Filho (7):
> =C2=A0 rust: add definitions for ref-counted inodes and dentries
> =C2=A0 rust: add ability to register a file system
> =C2=A0 rust: define fs context
> =C2=A0 rust: add support for file system parameters
> =C2=A0 rust: allow fs driver to initialise new superblocks
> =C2=A0 rust: add `module_fs` macro
> =C2=A0 WIP: rust: allow fs to be populated
>
> =C2=A0Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 14 +-
> =C2=A0arch/x86/configs/qemu-busybox-min.config=C2=A0 |=C2=A0=C2=A0 11 +
> =C2=A0kernel/configs/qemu-busybox-min.config=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 56 +
> =C2=A0kernel/configs/rust.config=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 11 +
> =C2=A0rust/.gitignore=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0rust/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 232 +-
> =C2=A0rust/alloc/vec/mod.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 48 +
> =C2=A0rust/bindings/bindings_helper.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 14 +
> =C2=A0rust/bindings/lib.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0=C2=A0 5 +
> =C2=A0rust/helpers.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 76 +
> =C2=A0rust/hex/error.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 78 +
> =C2=A0rust/hex/lib.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 506 +++
> =C2=A0rust/hex/serde.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 104 +
> =C2=A0rust/kernel/cred.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 46 +
> =C2=A0rust/kernel/delay.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 104 +
> =C2=A0rust/kernel/driver.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 28 +
> =C2=A0rust/kernel/error.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 52 +-
> =C2=A0rust/kernel/file.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 1117 ++++++
> =C2=A0rust/kernel/fs.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 1478 ++++++++
> =C2=A0rust/kernel/fs/param.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
558 +++
> =C2=A0rust/kernel/io_buffer.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 153 +
> =C2=A0rust/kernel/iov_iter.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 81 +
> =C2=A0rust/kernel/lib.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 83 +
> =C2=A0rust/kernel/mm.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 149 +
> =C2=A0rust/kernel/mount.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 66 +
> =C2=A0rust/kernel/pages.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 144 +
> =C2=A0rust/kernel/str.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 6 +
> =C2=A0rust/kernel/test_serde.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 26 +
> =C2=A0rust/kernel/test_serde/de.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 439 +++
> =C2=A0rust/kernel/test_serde/error.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 73 +
> =C2=A0rust/kernel/test_serde/ser.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 466 +++
> =C2=A0rust/kernel/user_ptr.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
175 +
> =C2=A0rust/proc-macro2/detection.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 77 +
> =C2=A0rust/proc-macro2/fallback.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1004 ++++++
> =C2=A0rust/proc-macro2/lib.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1341 +=
+++++++
> =C2=A0rust/proc-macro2/marker.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 20 +
> =C2=A0rust/proc-macro2/parse.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 874 +++++
> =C2=A0rust/proc-macro2/rcvec.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 144 +
> =C2=A0rust/proc-macro2/wrapper.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 996 ++++++
> =C2=A0rust/quote/ext.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 112 +
> =C2=A0rust/quote/format.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 170 +
> =C2=A0rust/quote/ident_fragment.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 88 +
> =C2=A0rust/quote/lib.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 1436 ++++++++
> =C2=A0rust/quote/runtime.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 440 +++
> =C2=A0rust/quote/spanned.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 45 +
> =C2=A0rust/quote/to_tokens.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
211 ++
> =C2=A0rust/serde/de/format.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 32 +
> =C2=A0rust/serde/de/ignored_any.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 246 ++
> =C2=A0rust/serde/de/impls.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 275=
5 +++++++++++++++
> =C2=A0rust/serde/de/mod.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 2313 +++++++++++++
> =C2=A0rust/serde/de/seed.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 21 +
> =C2=A0rust/serde/de/utf8.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 48 +
> =C2=A0rust/serde/de/value.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 171=
8 ++++++++++
> =C2=A0rust/serde/integer128.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
84 +
> =C2=A0rust/serde/lib.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 351 ++
> =C2=A0rust/serde/macros.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 238 ++
> =C2=A0rust/serde/private/de.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2997 +++++++=
+++++++++
> =C2=A0rust/serde/private/doc.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 161 +
> =C2=A0rust/serde/private/mod.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 52 +
> =C2=A0rust/serde/private/ser.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1316 +++++++
> =C2=A0rust/serde/private/size_hint.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 23 +
> =C2=A0rust/serde/ser/fmt.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 180 +
> =C2=A0rust/serde/ser/impls.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
987 ++++++
> =C2=A0rust/serde/ser/impossible.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 218 ++
> =C2=A0rust/serde/ser/mod.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 1992 +++++++++++
> =C2=A0rust/serde/std_error.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 50 +
> =C2=A0rust/serde_cbor/de.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 1370 ++++++++
> =C2=A0rust/serde_cbor/error.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 320 ++
> =C2=A0rust/serde_cbor/lib.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 371 ++
> =C2=A0rust/serde_cbor/read.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
647 ++++
> =C2=A0rust/serde_cbor/ser.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 748 ++++
> =C2=A0rust/serde_cbor/tags.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
224 ++
> =C2=A0rust/serde_cbor/value/de.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 168 +
> =C2=A0rust/serde_cbor/value/mod.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 158 +
> =C2=A0rust/serde_cbor/value/ser.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 447 +++
> =C2=A0rust/serde_cbor/write.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 177 +
> =C2=A0rust/serde_derive/bound.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 408 +++
> =C2=A0rust/serde_derive/de.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3148 +=
++++++++++++++++
> =C2=A0rust/serde_derive/dummy.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 46 +
> =C2=A0rust/serde_derive/fragment.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 76 +
> =C2=A0rust/serde_derive/internals/ast.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 204 ++
> =C2=A0rust/serde_derive/internals/attr.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 1908 +++++++++++
> =C2=A0rust/serde_derive/internals/case.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 199 ++
> =C2=A0rust/serde_derive/internals/check.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 445 +++
> =C2=A0rust/serde_derive/internals/ctxt.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 64 +
> =C2=A0rust/serde_derive/internals/mod.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 30 +
> =C2=A0rust/serde_derive/internals/receiver.rs=C2=A0=C2=A0 |=C2=A0 287 ++
> =C2=A0rust/serde_derive/internals/respan.rs=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 18 +
> =C2=A0rust/serde_derive/internals/symbol.rs=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 71 +
> =C2=A0rust/serde_derive/lib.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 112 +
> =C2=A0rust/serde_derive/pretend.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 203 ++
> =C2=A0rust/serde_derive/ser.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1342 ++++++++
> =C2=A0rust/serde_derive/this.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 34 +
> =C2=A0rust/serde_derive/try.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
26 +
> =C2=A0rust/syn/attr.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 664 ++++
> =C2=A0rust/syn/await.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 4 +
> =C2=A0rust/syn/bigint.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 68 +
> =C2=A0rust/syn/buffer.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 400 +++
> =C2=A0rust/syn/custom_keyword.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 255 ++
> =C2=A0rust/syn/custom_punctuation.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 302 ++
> =C2=A0rust/syn/data.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 495 +++
> =C2=A0rust/syn/derive.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 276 ++
> =C2=A0rust/syn/discouraged.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
196 ++
> =C2=A0rust/syn/error.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 430 +++
> =C2=A0rust/syn/export.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 41 +
> =C2=A0rust/syn/expr.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 3560 +++++++++++++++++++
> =C2=A0rust/syn/ext.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 141 +
> =C2=A0rust/syn/file.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 127 +
> =C2=A0rust/syn/gen/clone.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 2243 ++++++++++++
> =C2=A0rust/syn/gen/debug.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 3044 +++++++++++++++++
> =C2=A0rust/syn/gen/eq.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 2197 ++++++++++++
> =C2=A0rust/syn/gen/fold.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 3343 ++++++++++++++++++
> =C2=A0rust/syn/gen/hash.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 2871 ++++++++++++++++
> =C2=A0rust/syn/gen/visit.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 3788 +++++++++++++++++++++
> =C2=A0rust/syn/gen/visit_mut.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3788 +++++++++++++=
++++++++
> =C2=A0rust/syn/gen_helper.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 156 +
> =C2=A0rust/syn/generics.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 1339 ++++++++
> =C2=A0rust/syn/group.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 284 ++
> =C2=A0rust/syn/ident.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 103 +
> =C2=A0rust/syn/item.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 3315 ++++++++++++++++++
> =C2=A0rust/syn/lib.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 985 ++++++
> =C2=A0rust/syn/lifetime.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 156 +
> =C2=A0rust/syn/lit.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1602 +++++++++
> =C2=A0rust/syn/lookahead.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 171 +
> =C2=A0rust/syn/mac.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 221 ++
> =C2=A0rust/syn/macros.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 179 +
> =C2=A0rust/syn/op.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 236 ++
> =C2=A0rust/syn/parse.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 1316 +++++++
> =C2=A0rust/syn/parse_macro_input.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 181 +
> =C2=A0rust/syn/parse_quote.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
169 +
> =C2=A0rust/syn/pat.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 929 +++++
> =C2=A0rust/syn/path.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 856 +++++
> =C2=A0rust/syn/print.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 18 +
> =C2=A0rust/syn/punctuated.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 107=
0 ++++++
> =C2=A0rust/syn/reserved.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 46 +
> =C2=A0rust/syn/sealed.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 6 +
> =C2=A0rust/syn/span.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 69 +
> =C2=A0rust/syn/spanned.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 116 +
> =C2=A0rust/syn/stmt.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 351 ++
> =C2=A0rust/syn/thread.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 43 +
> =C2=A0rust/syn/token.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 1015 ++++++
> =C2=A0rust/syn/tt.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 109 +
> =C2=A0rust/syn/ty.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1288 +++++++
> =C2=A0rust/syn/verbatim.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 35 +
> =C2=A0rust/syn/whitespace.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 67 +
> =C2=A0samples/rust/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 28 +
> =C2=A0samples/rust/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0=C2=A0 3 +
> =C2=A0samples/rust/local_data_format/de.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 422 +++
> =C2=A0samples/rust/local_data_format/error.rs=C2=A0=C2=A0 |=C2=A0=C2=A0 7=
3 +
> =C2=A0samples/rust/local_data_format/ser.rs=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 443 +++
> =C2=A0samples/rust/puzzle.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 4 +
> =C2=A0samples/rust/puzzle/error.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 91 +
> =C2=A0samples/rust/puzzle/inode.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 150 +
> =C2=A0samples/rust/puzzle/oci.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 71 +
> =C2=A0samples/rust/puzzle/types.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 389 +++
> =C2=A0samples/rust/puzzle/types/cbor_helpers.rs |=C2=A0=C2=A0 50 +
> =C2=A0samples/rust/puzzlefs.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 220 ++
> =C2=A0samples/rust/rust_fs.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
105 +
> =C2=A0samples/rust/rust_serde.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 125 +
> =C2=A0scripts/Makefile.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 4 +-
> =C2=A0160 files changed, 89204 insertions(+), 29 deletions(-)
> =C2=A0create mode 100644 arch/x86/configs/qemu-busybox-min.config
> =C2=A0create mode 100644 kernel/configs/qemu-busybox-min.config
> =C2=A0create mode 100644 rust/hex/error.rs
> =C2=A0create mode 100644 rust/hex/lib.rs
> =C2=A0create mode 100644 rust/hex/serde.rs
> =C2=A0create mode 100644 rust/kernel/cred.rs
> =C2=A0create mode 100644 rust/kernel/delay.rs
> =C2=A0create mode 100644 rust/kernel/driver.rs
> =C2=A0create mode 100644 rust/kernel/file.rs
> =C2=A0create mode 100644 rust/kernel/fs.rs
> =C2=A0create mode 100644 rust/kernel/fs/param.rs
> =C2=A0create mode 100644 rust/kernel/io_buffer.rs
> =C2=A0create mode 100644 rust/kernel/iov_iter.rs
> =C2=A0create mode 100644 rust/kernel/mm.rs
> =C2=A0create mode 100644 rust/kernel/mount.rs
> =C2=A0create mode 100644 rust/kernel/pages.rs
> =C2=A0create mode 100644 rust/kernel/test_serde.rs
> =C2=A0create mode 100644 rust/kernel/test_serde/de.rs
> =C2=A0create mode 100644 rust/kernel/test_serde/error.rs
> =C2=A0create mode 100644 rust/kernel/test_serde/ser.rs
> =C2=A0create mode 100644 rust/kernel/user_ptr.rs
> =C2=A0create mode 100644 rust/proc-macro2/detection.rs
> =C2=A0create mode 100644 rust/proc-macro2/fallback.rs
> =C2=A0create mode 100644 rust/proc-macro2/lib.rs
> =C2=A0create mode 100644 rust/proc-macro2/marker.rs
> =C2=A0create mode 100644 rust/proc-macro2/parse.rs
> =C2=A0create mode 100644 rust/proc-macro2/rcvec.rs
> =C2=A0create mode 100644 rust/proc-macro2/wrapper.rs
> =C2=A0create mode 100644 rust/quote/ext.rs
> =C2=A0create mode 100644 rust/quote/format.rs
> =C2=A0create mode 100644 rust/quote/ident_fragment.rs
> =C2=A0create mode 100644 rust/quote/lib.rs
> =C2=A0create mode 100644 rust/quote/runtime.rs
> =C2=A0create mode 100644 rust/quote/spanned.rs
> =C2=A0create mode 100644 rust/quote/to_tokens.rs
> =C2=A0create mode 100644 rust/serde/de/format.rs
> =C2=A0create mode 100644 rust/serde/de/ignored_any.rs
> =C2=A0create mode 100644 rust/serde/de/impls.rs
> =C2=A0create mode 100644 rust/serde/de/mod.rs
> =C2=A0create mode 100644 rust/serde/de/seed.rs
> =C2=A0create mode 100644 rust/serde/de/utf8.rs
> =C2=A0create mode 100644 rust/serde/de/value.rs
> =C2=A0create mode 100644 rust/serde/integer128.rs
> =C2=A0create mode 100644 rust/serde/lib.rs
> =C2=A0create mode 100644 rust/serde/macros.rs
> =C2=A0create mode 100644 rust/serde/private/de.rs
> =C2=A0create mode 100644 rust/serde/private/doc.rs
> =C2=A0create mode 100644 rust/serde/private/mod.rs
> =C2=A0create mode 100644 rust/serde/private/ser.rs
> =C2=A0create mode 100644 rust/serde/private/size_hint.rs
> =C2=A0create mode 100644 rust/serde/ser/fmt.rs
> =C2=A0create mode 100644 rust/serde/ser/impls.rs
> =C2=A0create mode 100644 rust/serde/ser/impossible.rs
> =C2=A0create mode 100644 rust/serde/ser/mod.rs
> =C2=A0create mode 100644 rust/serde/std_error.rs
> =C2=A0create mode 100644 rust/serde_cbor/de.rs
> =C2=A0create mode 100644 rust/serde_cbor/error.rs
> =C2=A0create mode 100644 rust/serde_cbor/lib.rs
> =C2=A0create mode 100644 rust/serde_cbor/read.rs
> =C2=A0create mode 100644 rust/serde_cbor/ser.rs
> =C2=A0create mode 100644 rust/serde_cbor/tags.rs
> =C2=A0create mode 100644 rust/serde_cbor/value/de.rs
> =C2=A0create mode 100644 rust/serde_cbor/value/mod.rs
> =C2=A0create mode 100644 rust/serde_cbor/value/ser.rs
> =C2=A0create mode 100644 rust/serde_cbor/write.rs
> =C2=A0create mode 100644 rust/serde_derive/bound.rs
> =C2=A0create mode 100644 rust/serde_derive/de.rs
> =C2=A0create mode 100644 rust/serde_derive/dummy.rs
> =C2=A0create mode 100644 rust/serde_derive/fragment.rs
> =C2=A0create mode 100644 rust/serde_derive/internals/ast.rs
> =C2=A0create mode 100644 rust/serde_derive/internals/attr.rs
> =C2=A0create mode 100644 rust/serde_derive/internals/case.rs
> =C2=A0create mode 100644 rust/serde_derive/internals/check.rs
> =C2=A0create mode 100644 rust/serde_derive/internals/ctxt.rs
> =C2=A0create mode 100644 rust/serde_derive/internals/mod.rs
> =C2=A0create mode 100644 rust/serde_derive/internals/receiver.rs
> =C2=A0create mode 100644 rust/serde_derive/internals/respan.rs
> =C2=A0create mode 100644 rust/serde_derive/internals/symbol.rs
> =C2=A0create mode 100644 rust/serde_derive/lib.rs
> =C2=A0create mode 100644 rust/serde_derive/pretend.rs
> =C2=A0create mode 100644 rust/serde_derive/ser.rs
> =C2=A0create mode 100644 rust/serde_derive/this.rs
> =C2=A0create mode 100644 rust/serde_derive/try.rs
> =C2=A0create mode 100644 rust/syn/attr.rs
> =C2=A0create mode 100644 rust/syn/await.rs
> =C2=A0create mode 100644 rust/syn/bigint.rs
> =C2=A0create mode 100644 rust/syn/buffer.rs
> =C2=A0create mode 100644 rust/syn/custom_keyword.rs
> =C2=A0create mode 100644 rust/syn/custom_punctuation.rs
> =C2=A0create mode 100644 rust/syn/data.rs
> =C2=A0create mode 100644 rust/syn/derive.rs
> =C2=A0create mode 100644 rust/syn/discouraged.rs
> =C2=A0create mode 100644 rust/syn/error.rs
> =C2=A0create mode 100644 rust/syn/export.rs
> =C2=A0create mode 100644 rust/syn/expr.rs
> =C2=A0create mode 100644 rust/syn/ext.rs
> =C2=A0create mode 100644 rust/syn/file.rs
> =C2=A0create mode 100644 rust/syn/gen/clone.rs
> =C2=A0create mode 100644 rust/syn/gen/debug.rs
> =C2=A0create mode 100644 rust/syn/gen/eq.rs
> =C2=A0create mode 100644 rust/syn/gen/fold.rs
> =C2=A0create mode 100644 rust/syn/gen/hash.rs
> =C2=A0create mode 100644 rust/syn/gen/visit.rs
> =C2=A0create mode 100644 rust/syn/gen/visit_mut.rs
> =C2=A0create mode 100644 rust/syn/gen_helper.rs
> =C2=A0create mode 100644 rust/syn/generics.rs
> =C2=A0create mode 100644 rust/syn/group.rs
> =C2=A0create mode 100644 rust/syn/ident.rs
> =C2=A0create mode 100644 rust/syn/item.rs
> =C2=A0create mode 100644 rust/syn/lib.rs
> =C2=A0create mode 100644 rust/syn/lifetime.rs
> =C2=A0create mode 100644 rust/syn/lit.rs
> =C2=A0create mode 100644 rust/syn/lookahead.rs
> =C2=A0create mode 100644 rust/syn/mac.rs
> =C2=A0create mode 100644 rust/syn/macros.rs
> =C2=A0create mode 100644 rust/syn/op.rs
> =C2=A0create mode 100644 rust/syn/parse.rs
> =C2=A0create mode 100644 rust/syn/parse_macro_input.rs
> =C2=A0create mode 100644 rust/syn/parse_quote.rs
> =C2=A0create mode 100644 rust/syn/pat.rs
> =C2=A0create mode 100644 rust/syn/path.rs
> =C2=A0create mode 100644 rust/syn/print.rs
> =C2=A0create mode 100644 rust/syn/punctuated.rs
> =C2=A0create mode 100644 rust/syn/reserved.rs
> =C2=A0create mode 100644 rust/syn/sealed.rs
> =C2=A0create mode 100644 rust/syn/span.rs
> =C2=A0create mode 100644 rust/syn/spanned.rs
> =C2=A0create mode 100644 rust/syn/stmt.rs
> =C2=A0create mode 100644 rust/syn/thread.rs
> =C2=A0create mode 100644 rust/syn/token.rs
> =C2=A0create mode 100644 rust/syn/tt.rs
> =C2=A0create mode 100644 rust/syn/ty.rs
> =C2=A0create mode 100644 rust/syn/verbatim.rs
> =C2=A0create mode 100644 rust/syn/whitespace.rs
> =C2=A0create mode 100644 samples/rust/local_data_format/de.rs
> =C2=A0create mode 100644 samples/rust/local_data_format/error.rs
> =C2=A0create mode 100644 samples/rust/local_data_format/ser.rs
> =C2=A0create mode 100644 samples/rust/puzzle.rs
> =C2=A0create mode 100644 samples/rust/puzzle/error.rs
> =C2=A0create mode 100644 samples/rust/puzzle/inode.rs
> =C2=A0create mode 100644 samples/rust/puzzle/oci.rs
> =C2=A0create mode 100644 samples/rust/puzzle/types.rs
> =C2=A0create mode 100644 samples/rust/puzzle/types/cbor_helpers.rs
> =C2=A0create mode 100644 samples/rust/puzzlefs.rs
> =C2=A0create mode 100644 samples/rust/rust_fs.rs
> =C2=A0create mode 100644 samples/rust/rust_serde.rs

