Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED5FC001B0
	for <rust-for-linux@archiver.kernel.org>; Sat, 15 Jul 2023 15:10:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbjGOPKa (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 15 Jul 2023 11:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbjGOPK3 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 15 Jul 2023 11:10:29 -0400
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC78E2D55
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Jul 2023 08:10:26 -0700 (PDT)
Date:   Sat, 15 Jul 2023 15:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1689433824; x=1689693024;
        bh=TKdtk/xQQY6AuQ6CvCqcxHX72GN4PtndnE8ZmbL4F0Y=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=IukIrZtwofuJvyjTz6aVE9zJ+VeM+t8+FxBspkLQQXHk0Dmr1SpIQEcDLRJZUASd9
         yysUyPt8b06oDq+ZIxk1jb/W+tjunnT+dAt4oiCYSNTYB7VAIj51Tz8n82SKFh58aK
         Mu3AuVY579qPzLRIQr2sItMEX8uplxoyJqvaoXK+zKu9PnVozTVXCffTnC/oZp0boU
         UCMX1PMz4HLd4mklDjLA3lk9ZfI+KNQhwI1RD+nGWY0o1g103n1YYalE4MJhBgIGTD
         TVj3Ou9GKSdgvaFqHc0by21zFe+PfSeyPCwUSFN5ugQdaShZZmwKMXiWmOkCiLMW5/
         wxk6gQ7fa9l2w==
To:     Martin Rodriguez Reboredo <yakoyoku@gmail.com>
From:   Benno Lossin <benno.lossin@proton.me>
Cc:     rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>
Subject: Re: [PATCH v2] scripts: read cfgs from Makefile for rust-analyzer
Message-ID: <UNNYZPvSjkF1LFhX3VpAPSscY-z09oyuMXMW5f43bXBI0GeOYpcVk79sC9dFS12mNMtRZIYPwa6txmDAa4ewPmJb8SaaWrMnvYvaYJ-IeqA=@proton.me>
In-Reply-To: <a961984e-9837-1534-6b23-87eaaed3d9a9@gmail.com>
References: <20230520231701.46008-1-yakoyoku@gmail.com> <diYQuBM2vYke0twpM2m8npuzVA2tHeJ2y52qN25pwSUmgBG0wxwaEQjBVg8eZnxu2kqcBf8wqNiu0aqgAGR3mlmtT2wPuO_HbVxAyhxR3X0=@proton.me> <1326c1e8-1707-9275-c1b4-4b4870912158@gmail.com> <fW_Nn96x2phVy1b0wgVr6-xSGl3YXXhw5r-3XmAbDz_vsYWr3OmRu-b8pQnVlf0OcAbXRa9BnJXc_tsqVPijmkQtHTAzoZlbt8Gl-4f423w=@proton.me> <a961984e-9837-1534-6b23-87eaaed3d9a9@gmail.com>
Feedback-ID: 71780778:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 15.07.23 16:40, Martin Rodriguez Reboredo wrote:
>> If you want, I can upload the `rust-project.json` file to GH, since
>> it is 55k lines long.
>>
>=20
> I'm thinking that you may be looking at the wrong side.=20

Seems so, I looked at `bindings` and `kernel`, but got confused by deps.
I also verified that without your patch all of those configs are present.

Still I find it a bit confusing that all of these configs are present
there. How does rust-analyzer use those?

Also sorry for the noise.

> So, can you show me the output of these `jq` commands?
>=20
> ```sh
> jq '.crates[] | select(.display_name =3D=3D "core")' rust-project.json
> jq '.crates[] | select(.display_name =3D=3D "alloc")' rust-project.json
> ```

```
{
  "cfg": [
    "no_fp_fmt_parse"
  ],
  "deps": [],
  "display_name": "core",
  "edition": "2021",
  "env": {
    "RUST_MODFILE": "This is only for rust-analyzer"
  },
  "is_proc_macro": false,
  "is_workspace_member": false,
  "root_module": "~/.rustup/toolchains/1.68.2-x86_64-unknown-linux-gnu/lib/=
rustlib/src/rust/library/core/src/lib.rs"
}
```
and
```
{
  "cfg": [
    "no_borrow",
    "no_fmt",
    "no_global_oom_handling",
    "no_macros",
    "no_rc",
    "no_str",
    "no_string",
    "no_sync",
    "no_thin"
  ],
  "deps": [
    {
      "crate": 0,
      "name": "core"
    },
    {
      "crate": 1,
      "name": "compiler_builtins"
    }
  ],
  "display_name": "alloc",
  "edition": "2021",
  "env": {
    "RUST_MODFILE": "This is only for rust-analyzer"
  },
  "is_proc_macro": false,
  "is_workspace_member": true,
  "root_module": "rust/alloc/lib.rs"
}
```

--=20
Cheers,
Benno
