Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884C0C43219
	for <rust-for-linux@archiver.kernel.org>; Mon, 14 Nov 2022 14:40:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236791AbiKNOkN (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 14 Nov 2022 09:40:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237069AbiKNOjt (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 14 Nov 2022 09:39:49 -0500
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC412251C
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Nov 2022 06:39:37 -0800 (PST)
Date:   Mon, 14 Nov 2022 14:39:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1668436773; x=1668695973;
        bh=3kJuGS5uVSVzPLoxWGsOQFBiLJ7HrhLDmqmpBDrS0NA=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=fJTfY+Pn+ZqZee+nMnAaJCbwPHTnfoPKAv/qf7IIWScErzoVWFnp2pfEWWeIFYhHd
         ///1e33rt6sdUzzuUe9+FtQ2p9DcwSKdhrUMH0FM9GMCj2FyjgJAp1RBwMIMM5lLLd
         9Z2mTknOdkKuJ48KpYoZXOUu1/xeqRMTXofjDXyQr3NKCJdWslgHUqF6o0wemlOuCC
         4r/B5htHpS8e3qV84LYyr1rgRYnE9kDI+LwfV/rEm6nbpLBVPCVrAfduasdn6Aw3h3
         +eDyPYWqDP53CMbqT2lf/u9usEzh3NIpuemJWp1X5En+NX3QApYb/0WIhvnpjDoQv6
         tZwLblJRB2kDA==
To:     Gary Guo <gary@garyguo.net>
From:   =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev
Subject: Re: [PATCH v1 05/28] rust: macros: add `concat_idents!` proc macro
Message-ID: <_CF9aCGri4-OVipaa-ZySoRbBu17nlThYL3fGiHugcWQNAjgtE-ZBcekhmg_pM6uNGWsSuqoke-pGPgB7ZlGCI1Iyo_bl4RhtzfbdI0Z18g=@protonmail.com>
In-Reply-To: <20221114142611.2a21d4e9@GaryWorkstation>
References: <20221110164152.26136-1-ojeda@kernel.org> <20221110164152.26136-6-ojeda@kernel.org> <20221114142611.2a21d4e9@GaryWorkstation>
Feedback-ID: 27884398:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Monday, November 14th, 2022 at 15:26, Gary Guo <gary@garyguo.net> wrote:


> On Thu, 10 Nov 2022 17:41:17 +0100
> Miguel Ojeda ojeda@kernel.org wrote:
>=20
> > +pub(crate) fn concat_idents(ts: TokenStream) -> TokenStream {
> > + let mut it =3D ts.into_iter();
> > + let a =3D expect_ident(&mut it);
> > + assert_eq!(expect_punct(&mut it), ',');
> > + let b =3D expect_ident(&mut it);
> > + assert!(it.next().is_none(), "only two idents can be concatenated");
> > + let res =3D Ident::new(&(a.to_string() + &b.to_string()), b.span());
>=20
>=20
> Probably clearer to write `Ident::new(&format!("{a}{b}"), b.span())`
> here?
>=20
> Best,
> Gary

I agree that is clearer. I hadn't considered that Ident implements Display =
when I wrote it.

Cheers,
Bj=C3=B6rn
