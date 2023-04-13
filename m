Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF9DC77B6E
	for <rust-for-linux@archiver.kernel.org>; Thu, 13 Apr 2023 20:00:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbjDMUAP (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 13 Apr 2023 16:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbjDMUAK (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 13 Apr 2023 16:00:10 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B464977F
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Apr 2023 12:59:47 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id j11so4251689ljq.10
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Apr 2023 12:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681415986; x=1684007986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6tYx0/VXk2tFZrewXSd6E4jauzs+ytNSVJ+jGIHwYQ=;
        b=MJUgAS0oeO1fAsZtFbb06O/rrY1UWm9kyhUjbnbODv+tug5izoi/h043jXtitU06Tg
         PyWsbMqXhnNrI3i2e74FQcAtMJukVSM5todoOT31pt1/TTjDyklvBLcrsenRRfiOf1Ev
         BtQHGAEibgfJMUs2yKCKuOL8Xkp12iYoMzRJhBlcvDX3066pV7kIECGG1h40gesHSel6
         PqfHLRWJ6JoBOFoIjVTi927nKPl7St6/4ixgrAEcDzMZJ4wA6SiQdVSPx7OyN2f6BTjN
         3+uF2ez9XvakF3QcCxIFFmaSuOWSzHyykmmJmc3xu2BBaB5Xla3hqtBo5yrOMQu1QE6G
         7Y9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681415986; x=1684007986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6tYx0/VXk2tFZrewXSd6E4jauzs+ytNSVJ+jGIHwYQ=;
        b=gXgxS96Ey4AAXaOSmbOOHfYfUIuWh0jiLuv7hNfEHzzdDE7nOOfYMIcN35qxqZPCmS
         cgeqLrJNBnvQILbI+h0h5QDAursocGNJRShB3zOgt0ZytHI/AkEnexDJbZHmyLC9HiWi
         Tjsb3WU1GKKpIgxhUOcCaMtnvlihlj/0d6sn58SdX3jXCStO1tULKpnq2RebGCtSz0yf
         tb5xHhwX76om0KQz9Gc/UUQApQcDA+9QLf4hWm+Q9RoDEitlcsHzOfyaPcbYTX3zJWKm
         3JR5rffUtNRimYcAHrXcKI13B6176h5jpg2ij9AvKm5//kf7PklymPPoz9Axft31vvNk
         xc6Q==
X-Gm-Message-State: AAQBX9fE7aZkCSq0obPWMaWxtZupnRcZTQ5EAlxZ1p7Um8N72OGiUk0q
        IdEVhVg26b/4Ta6+UXQflhk+tAbGYESRJfuNEDdSPedyvSE=
X-Google-Smtp-Source: AKy350Z81gnjld0pKZsjODTStBzYfLoAmjaKCklr7oYq6sK5dA+2CYlL/b3MoSUhRBjIETb0xCy+Xy3SkCRsQ5Ru5Rk=
X-Received: by 2002:a2e:80d0:0:b0:2a7:a6ac:3148 with SMTP id
 r16-20020a2e80d0000000b002a7a6ac3148mr1132168ljg.3.1681415985490; Thu, 13 Apr
 2023 12:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230413140138.348137-1-amiculas@cisco.com> <CANiq72mTyMzJVMEAfNo9TyevN8jbqV0L=ba8=Ym-2Oxhm7oniQ@mail.gmail.com>
 <CAPDJoNsPWEBWqH21Ho409AkkFDaN9mvM2YDjwVAjSyjqGjEbNg@mail.gmail.com> <CANeycqpPSQVrHqo4RLXn6g5LwMZn382W8YzUp2QE-UOBN80pLQ@mail.gmail.com>
In-Reply-To: <CANeycqpPSQVrHqo4RLXn6g5LwMZn382W8YzUp2QE-UOBN80pLQ@mail.gmail.com>
From:   Ariel Miculas <ariel.miculas@gmail.com>
Date:   Thu, 13 Apr 2023 22:59:34 +0300
Message-ID: <CAPDJoNtxftzbqrWtV0102bVVit2imd7De6OHPFw0f=EbZ_nbVw@mail.gmail.com>
Subject: Re: [PATCH] rust: Add functions to create and modify an Inode
To:     Wedson Almeida Filho <wedsonaf@gmail.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        rust-for-linux@vger.kernel.org, Ariel Miculas <amiculas@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Thanks, Wedson, I wasn't aware of your branch. I'm definitely
interested in helping out, let me know what I can do. I'm new to
rust-for-linux, though, so don't expect too much.

Regards,
Ariel


On Thu, Apr 13, 2023 at 10:41=E2=80=AFPM Wedson Almeida Filho
<wedsonaf@gmail.com> wrote:
>
> On Thu, 13 Apr 2023 at 16:05, Ariel Miculas <ariel.miculas@gmail.com> wro=
te:
> >
> > Thanks Miguel, you've clarified some questions I had about the
> > branches and the development process.
> > Regarding the rust branch, it says:
> > > However, please feel free to submit new PRs for this branch.
> >
> > Does it make sense to open PRs against the rust branch in github and
> > ask for feedback that way or should the existing fs.rs from the rust
> > branch be merged into rust-next instead (and then I could submit
> > patches)?
> > For context, I'm trying to add the necessary fs abstractions in order
> > to be able to rewrite lwnfs (https://lwn.net/Articles/57369/) in rust.
> > I want to ask for feedback early because I'm not sure the abstractions
> > I come up with are the right ones.
>
> Please checkout https://github.com/wedsonaf/linux/commits/fs
>
> This is the continuation of the code currently in the `rust` branch.
> It allows the creation of a read-only in-memory file system as you can
> see in the sample code.
>
> I was working on it with the intent of merging it to `rust` but then
> we decided to cut down what was upstreamed to a bare minimum, so I put
> this on the back burner while we push other pieces (on which this
> depends) upstream first. We also heard from Matthew Wilcox (the page
> cache maintainer) on LPC that he has ideas on what the interface
> should (or shouldn't) look like. So we'll get him involved [if he has
> the time] once we have the dependencies upstreamed.
>
> Some of the code we know will change for the better now that we have pin-=
init.
>
> Anyway, you're welcome to join us if you're interested.
>
> Cheers,
> -Wedson
>
> > Regards,
> > Ariel
> >
> >
> > On Thu, Apr 13, 2023 at 9:36=E2=80=AFPM Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> wrote:
> > >
> > > Hi Ariel,
> > >
> > > On Thu, Apr 13, 2023 at 4:15=E2=80=AFPM Ariel Miculas <ariel.miculas@=
gmail.com> wrote:
> > > >
> > > > Add try_new_inode function associated to SuperBlock which allocates=
 a
> > > > new inode and implement a few setter functions for INode.
> > >
> > > Thanks for the patch!
> > >
> > > This seems to be based on the `rust` branch: the filesystem
> > > abstractions we have there are not yet in mainline, so we can't take
> > > this now since `fs.rs` does not exist yet. Please see
> > > https://rust-for-linux.com/branches.
> > >
> > > Also, I haven't reviewed the patch, but some quick notes below that
> > > you may find useful.
> > >
> > > > +        let inode =3D unsafe { bindings::new_inode(self.0.get()) }=
;
> > >
> > > Please follow the coding conventions / guidelines of the rest of othe=
r
> > > code. For instance, we require `// SAFETY` comments on all `unsafe`
> > > blocks. Please see https://docs.kernel.org/rust/coding-guidelines.htm=
l
> > > for some details.
> > >
> > > > +    /// set the field i_mode of the inode
> > >
> > > Ditto, for docs.
> > >
> > > > +    pub fn set_fop(&mut self, fop: *const bindings::file_operation=
s) {
> > >
> > > If this is intended to be used by modules (as it appears to be since
> > > it is public in a public module), then you will likely need to avoid
> > > referring to `bindings::` so that modules do not need to deal directl=
y
> > > with the C types.
> > >
> > > Moreover, the fact that a safe function takes a raw pointer raises
> > > some questions -- what happens if somebody passes a dangling pointer,
> > > for instance?
> > >
> > > Cheers,
> > > Miguel
