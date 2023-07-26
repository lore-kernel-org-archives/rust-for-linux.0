Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF2D18045
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Jul 2023 21:08:55 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C5521BFB
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Jul 2023 14:08:53 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-992e22c09edso18864666b.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Jul 2023 14:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1690405732; x=1691010532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjkLXak8d+/QRW6V4ufp25mmvem0zi/hCFrifSGngFs=;
        b=ZuSNoM2neGgmzJ1HDcF0VbUgodiwml7GqlGB44XNU8z5ksD6ZgMFqxzRPQ/SOCjj4c
         ARW7u1YMSMc1qazZhCR8R7yOPL7bOd/vH43fz1I2RCkJzEm95afcsIadPOIYU/QIdQfr
         Tla/Ks/rrhbE94krRIMf/jrGJbH3Ww5d5rLLy+EQ0WGCoRgWGznST2uHoLjGiMp0uocQ
         QnXb6vmTvRegB76hyRWSgc14aNXqn1Uv+hBAIt4puE5lpAIwJqRZnKIM5UAazLI20hLC
         JdpL4f5XboVywAr0dntT3KVk9t04zLbwt77q8P8VWPJ+RN7t4OjXlNEadTBgDe8q8XG/
         9gIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690405732; x=1691010532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjkLXak8d+/QRW6V4ufp25mmvem0zi/hCFrifSGngFs=;
        b=iBK2UyTZVCFIqPecibJsxYa8SNmS5OfTJJUkoyqA7i/6gkLSv/PkddF2yA99ExziQy
         bnladIC6TnPZpue10hR6AQdXwv0H6vuk/j364+g35HG34zqcCXk4fKX9xVntHiaaO312
         fE2Ypm3GEkqM7iNLuJgJD1heygWxPGCJHV7rh42Xcnm08sy2RgbV2ai5V+ap4pxZic/i
         AM9GW9vCiO5GgRWJ3sJBiSxMc/ezC0jXGM7fwj58g+BjQx1yQcNmkVY9a61TTgiifo7B
         ra5JdmJYB/Osnj3c/2shg6t5tAKYGQMF6c14kjYd8dWiliNrS63o5XwS3LrS8KCX+6o3
         wEkg==
X-Gm-Message-State: ABy/qLakwimbG/hs2lsIS+xPOg0hdCnfn7P39Vu6NtkqHDsVCFuAc09v
	Ne3QSSKKwECRsov2halq3ltWzFhI/OBXTe0wqfMBYg==
X-Google-Smtp-Source: APBJJlFQX7UzDW/k/kYtWDvZK568AeNZukeBl2pXtyjIMni9uWicDax9fIk3Xw0AO67YAsFOv9YnJHcBKz+EEJqcJyI=
X-Received: by 2002:a17:906:7391:b0:994:54af:e282 with SMTP id
 f17-20020a170906739100b0099454afe282mr213636ejl.10.1690405732051; Wed, 26 Jul
 2023 14:08:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230726164535.230515-1-amiculas@cisco.com> <20230726164535.230515-11-amiculas@cisco.com>
In-Reply-To: <20230726164535.230515-11-amiculas@cisco.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 26 Jul 2023 17:08:40 -0400
Message-ID: <CALNs47ss3kV3mTx4ksYTWaHWdRG48=97DTi3OEnPom2nFcYhHw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 10/10] rust: puzzlefs: add oci_root_dir and
 image_manifest filesystem parameters
To: Ariel Miculas <amiculas@cisco.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, tycho@tycho.pizza, brauner@kernel.org, 
	viro@zeniv.linux.org.uk, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Jul 26, 2023 at 12:55=E2=80=AFPM Ariel Miculas <amiculas@cisco.com>=
 wrote:
>
> These parameters are passed when mounting puzzlefs using '-o' option of
> mount:
> -o oci_root_dir=3D"/path/to/oci/dir"
> -o image_manifest=3D"root_hash_of_image_manifest"
>
> For a particular manifest in the manifests array in index.json (located
> in the oci_root_dir), the root hash of the image manifest is found in
> the digest field.
>
> It would be nicer if we could pass the tag, but we don't support json
> deserialization.
>
> Example of mount:
> mount -t puzzlefs -o oci_root_dir=3D"/home/puzzlefs_oci" -o \
> image_manifest=3D"2d6602d678140540dc7e96de652a76a8b16e8aca190bae141297bcf=
fdcae901b" \
> none /mnt
>
> Signed-off-by: Ariel Miculas <amiculas@cisco.com>
> ---
>  samples/rust/puzzlefs.rs | 63 ++++++++++++++++++++++++++--------------
>  1 file changed, 41 insertions(+), 22 deletions(-)
>
> diff --git a/samples/rust/puzzlefs.rs b/samples/rust/puzzlefs.rs
> index dad7ecc76eca..4e9a8aedf0c1 100644
> --- a/samples/rust/puzzlefs.rs
> +++ b/samples/rust/puzzlefs.rs
> @@ -7,6 +7,7 @@
>  use kernel::{
>      c_str, file, fs,
>      io_buffer::IoBufferWriter,
> +    str::CString,
>      sync::{Arc, ArcBorrow},
>  };
>
> @@ -31,27 +32,29 @@ struct PuzzlefsInfo {
>      puzzlefs: Arc<PuzzleFS>,
>  }
>
> +#[derive(Default)]
> +struct PuzzleFsParams {
> +    oci_root_dir: Option<CString>,
> +    image_manifest: Option<CString>,
> +}
> +
>  #[vtable]
>  impl fs::Context<Self> for PuzzleFsModule {
> -    type Data =3D ();
> -
> -    kernel::define_fs_params! {(),
> -        {flag, "flag", |_, v| { pr_info!("flag passed-in: {v}\n"); Ok(()=
) } },
> -        {flag_no, "flagno", |_, v| { pr_info!("flagno passed-in: {v}\n")=
; Ok(()) } },
> -        {bool, "bool", |_, v| { pr_info!("bool passed-in: {v}\n"); Ok(()=
) } },
> -        {u32, "u32", |_, v| { pr_info!("u32 passed-in: {v}\n"); Ok(()) }=
 },
> -        {u32oct, "u32oct", |_, v| { pr_info!("u32oct passed-in: {v}\n");=
 Ok(()) } },
> -        {u32hex, "u32hex", |_, v| { pr_info!("u32hex passed-in: {v}\n");=
 Ok(()) } },
> -        {s32, "s32", |_, v| { pr_info!("s32 passed-in: {v}\n"); Ok(()) }=
 },
> -        {u64, "u64", |_, v| { pr_info!("u64 passed-in: {v}\n"); Ok(()) }=
 },
> -        {string, "string", |_, v| { pr_info!("string passed-in: {v}\n");=
 Ok(()) } },
> -        {enum, "enum", [("first", 10), ("second", 20)], |_, v| {
> -            pr_info!("enum passed-in: {v}\n"); Ok(()) }
> -        },
> +    type Data =3D Box<PuzzleFsParams>;
> +
> +    kernel::define_fs_params! {Box<PuzzleFsParams>,
> +        {string, "oci_root_dir", |s, v| {
> +                                      s.oci_root_dir =3D Some(CString::t=
ry_from_fmt(format_args!("{v}"))?);
> +                                      Ok(())
> +                                  }},
> +        {string, "image_manifest", |s, v| {
> +                                      s.image_manifest =3D Some(CString:=
:try_from_fmt(format_args!("{v}"))?);
> +                                      Ok(())
> +                                  }},
>      }
>
> -    fn try_new() -> Result {
> -        Ok(())
> +    fn try_new() -> Result<Self::Data> {
> +        Ok(Box::try_new(PuzzleFsParams::default())?)
>      }
>  }
>
> @@ -136,11 +139,27 @@ impl fs::Type for PuzzleFsModule {
>      const FLAGS: i32 =3D fs::flags::USERNS_MOUNT;
>      const DCACHE_BASED: bool =3D true;
>
> -    fn fill_super(_data: (), sb: fs::NewSuperBlock<'_, Self>) -> Result<=
&fs::SuperBlock<Self>> {
> -        let puzzlefs =3D PuzzleFS::open(
> -            c_str!("/home/puzzlefs_oci"),
> -            c_str!("2d6602d678140540dc7e96de652a76a8b16e8aca190bae141297=
bcffdcae901b"),
> -        );
> +    fn fill_super(
> +        data: Box<PuzzleFsParams>,
> +        sb: fs::NewSuperBlock<'_, Self>,
> +    ) -> Result<&fs::SuperBlock<Self>> {
> +        let oci_root_dir =3D match data.oci_root_dir {
> +            Some(val) =3D> val,
> +            None =3D> {
> +                pr_err!("missing oci_root_dir parameter!\n");
> +                return Err(ENOTSUPP);
> +            }
> +        };
> +
> +        let image_manifest =3D match data.image_manifest {
> +            Some(val) =3D> val,
> +            None =3D> {
> +                pr_err!("missing image_manifest parameter!\n");
> +                return Err(ENOTSUPP);
> +            }
> +        };
> +

The guard syntax (available since 1.65) can make these kinds of match state=
ments
cleaner:

    let Some(oci_root_dir) =3D data.oci_root_dir else {
        pr_err!("missing oci_root_dir parameter!\n");
        return Err(ENOTSUPP);
    }

    let Some(image_manifest) ...

> +        let puzzlefs =3D PuzzleFS::open(&oci_root_dir, &image_manifest);
>
>          if let Err(ref e) =3D puzzlefs {
>              pr_info!("error opening puzzlefs {e}\n");
> --
> 2.41.0
>
>
