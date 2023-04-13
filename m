Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA75C77B6E
	for <rust-for-linux@archiver.kernel.org>; Thu, 13 Apr 2023 18:59:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbjDMS7w (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 13 Apr 2023 14:59:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbjDMS7r (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 13 Apr 2023 14:59:47 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA82D469E
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Apr 2023 11:59:40 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id bx15so14579834ljb.7
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Apr 2023 11:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681412379; x=1684004379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VHKtEa3r9V9FgJYPCZULaxfu35r8qKMvwfVzT2Wgcg=;
        b=FdOKmsPH0ZO5z+yZIpW/HxNXmIlFOJq2xAPRtMNYP4xCpZgBdePVorxtaL4zQFd4Tx
         yj+N079t9Mna62953ZiqCtzDVC/8AooFqQenF6SDUMjlH0GwiX1QPDR6TXwDB6IQKIcK
         upKsyIA9PqQFAi+e2HnJI7J+ocJaqQLP12MMIthcHBcGWwgkBkvmk7C+TrRf7MTaQvOh
         ornZgZDH0//MObfjQQVD8VE/teWaQItTIXR4SAy2eEW4LcveXgTM8gX78+JhMiUr9v5h
         yftYBktmwHvtBZVADnLzFOeBXtnYLOmwLpNEiHaOB6HTIfu55gxzoYebmpO90raUc98I
         PanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681412379; x=1684004379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8VHKtEa3r9V9FgJYPCZULaxfu35r8qKMvwfVzT2Wgcg=;
        b=BQLLNZrROh2fpDu10vAxdvIaRYUzf8R6EhhHx9AII1kFYbsatEO4jPEnbCWxhBkBMV
         4ccJiMfg6/UfRd9U76Ie6aN8Ki0NZaLcfVxr+Hf1nY5HkGtB52bzdzg2aC2oyVOUU2Iu
         cxVL2pp7yKcfq88emWdbAUbIZdoduO60fTnswPuTBzKv5ve6uqCTeWilW0Y+d7sh3HSI
         9ZfrUFZ9TmbBHC2U3snPcTI3J8FLTt81pzHtdsolEFzlQkCxUm1+86h0Pel9lOJwiIKW
         zzeC99j0iN8ahjJ8IQoTiKzPWnOxkDc1DPIRcnSIhVSF/gBFoKfaaY85BVOkBOhAb3Zg
         qR0w==
X-Gm-Message-State: AAQBX9eaqH0RpT+46gfGcIfKkdhSC7Y/JmUWyAPiVC5PhEM43R4pV4I/
        S6Q8aVkxgWBZrjs/WK8pERmCT5+hpXen1gKe0U/1GRJXVqc=
X-Google-Smtp-Source: AKy350Zh+qrGcVCu/KQj9YJUIb86sEeTpGsGgPTPcNa3eC6ja6ZBQ0naKWcMGXX3hnCAgH7Gnww2EtPIK+riFRvurO4=
X-Received: by 2002:a2e:940e:0:b0:29f:caf0:f77f with SMTP id
 i14-20020a2e940e000000b0029fcaf0f77fmr1115153ljh.3.1681412378890; Thu, 13 Apr
 2023 11:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230413140138.348137-1-amiculas@cisco.com> <CANiq72mTyMzJVMEAfNo9TyevN8jbqV0L=ba8=Ym-2Oxhm7oniQ@mail.gmail.com>
In-Reply-To: <CANiq72mTyMzJVMEAfNo9TyevN8jbqV0L=ba8=Ym-2Oxhm7oniQ@mail.gmail.com>
From:   Ariel Miculas <ariel.miculas@gmail.com>
Date:   Thu, 13 Apr 2023 21:59:27 +0300
Message-ID: <CAPDJoNsPWEBWqH21Ho409AkkFDaN9mvM2YDjwVAjSyjqGjEbNg@mail.gmail.com>
Subject: Re: [PATCH] rust: Add functions to create and modify an Inode
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux@vger.kernel.org, Ariel Miculas <amiculas@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Thanks Miguel, you've clarified some questions I had about the
branches and the development process.
Regarding the rust branch, it says:
> However, please feel free to submit new PRs for this branch.

Does it make sense to open PRs against the rust branch in github and
ask for feedback that way or should the existing fs.rs from the rust
branch be merged into rust-next instead (and then I could submit
patches)?
For context, I'm trying to add the necessary fs abstractions in order
to be able to rewrite lwnfs (https://lwn.net/Articles/57369/) in rust.
I want to ask for feedback early because I'm not sure the abstractions
I come up with are the right ones.

Regards,
Ariel


On Thu, Apr 13, 2023 at 9:36=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi Ariel,
>
> On Thu, Apr 13, 2023 at 4:15=E2=80=AFPM Ariel Miculas <ariel.miculas@gmai=
l.com> wrote:
> >
> > Add try_new_inode function associated to SuperBlock which allocates a
> > new inode and implement a few setter functions for INode.
>
> Thanks for the patch!
>
> This seems to be based on the `rust` branch: the filesystem
> abstractions we have there are not yet in mainline, so we can't take
> this now since `fs.rs` does not exist yet. Please see
> https://rust-for-linux.com/branches.
>
> Also, I haven't reviewed the patch, but some quick notes below that
> you may find useful.
>
> > +        let inode =3D unsafe { bindings::new_inode(self.0.get()) };
>
> Please follow the coding conventions / guidelines of the rest of other
> code. For instance, we require `// SAFETY` comments on all `unsafe`
> blocks. Please see https://docs.kernel.org/rust/coding-guidelines.html
> for some details.
>
> > +    /// set the field i_mode of the inode
>
> Ditto, for docs.
>
> > +    pub fn set_fop(&mut self, fop: *const bindings::file_operations) {
>
> If this is intended to be used by modules (as it appears to be since
> it is public in a public module), then you will likely need to avoid
> referring to `bindings::` so that modules do not need to deal directly
> with the C types.
>
> Moreover, the fact that a safe function takes a raw pointer raises
> some questions -- what happens if somebody passes a dangling pointer,
> for instance?
>
> Cheers,
> Miguel
