Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF57BC77B61
	for <rust-for-linux@archiver.kernel.org>; Thu, 13 Apr 2023 18:36:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjDMSg5 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 13 Apr 2023 14:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjDMSg4 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 13 Apr 2023 14:36:56 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4CE9769C
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Apr 2023 11:36:52 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id v7so14975631ybi.0
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Apr 2023 11:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681411012; x=1684003012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdAg+sjDTKhwZroJsdvwbvBG/acx9YbCJMZ8RmzweSU=;
        b=qb9KBdg2c1k076CiMZGEPY/JBKLDqUu9Oj+wk1JV2IXySeStiBKtu7ybtIg/0n7sBv
         17snKAOi4itsIVW+d/5mQ13to74X8R5hCJqr3uKFBG4kVXABWsC8quwre1II7VBhkCYE
         RnWoJhYvjJtYJz8wcb+tLx759HGPVOHVTMck58o9CZ2I30IJNXc8MvJy31rMWlm9w7Ud
         XJIbfiwEpSXJXuJ+YzpbsnIfkkFs32jCc/O5G8/3l9WLFkg0T79GtTDDDa99IItVjNWN
         4AThxiv5mUmc564d8n1CL3lipsIWamFYMSqxduQ43ixXyfNoy67EAzso+jX5FWIU9EOM
         B8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681411012; x=1684003012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SdAg+sjDTKhwZroJsdvwbvBG/acx9YbCJMZ8RmzweSU=;
        b=fVELfkLowXDu0oZyOCwt04j3v/S8y/N2z99AG82nRg0IDpcDnAyt6T8g/GDfhS+21l
         cxI7NG5QgL3TDy6LkceqwXUcSAS04D1q6sQ7SWveHqMNxjVPHTEkcdqSZCkkpu+BzDyY
         IBzY6kGb0XwkJ0zThBJsvb97Wu254n7bkpM+i4Ssx+dsXdTZ+1aQsCXSpfMXR7g74xhM
         MZ3JljkbEDd4n+L8LkvaM1gqWQFdjiVnn5g92hrf1A8kvphX8e/dOr7wFN/STeUFQ2fG
         lstRMT9wnU5ufKMns0FPbjWwFoLCWm3v28RgFj3x+AyyNxzNlQgvEDiUEB0qAg/oteke
         iIAQ==
X-Gm-Message-State: AAQBX9dcVKqmVGZDMGeYhZZ15biSpA/NUCnk7zu9WsBf3lYpPq59CxBQ
        NcVIVDVmNjmpF4r2mu/Ah1ofBPqUvi5l21s5BvECORGo
X-Google-Smtp-Source: AKy350bcWbY1h7DX93wsOvQqJL5PiHOy9EilAzMsD8pLeZ/0anYecxNe/OX6CoDd/pMkd9myc19NBLxSGwb+jGdFsaE=
X-Received: by 2002:a25:e08c:0:b0:b8f:3647:d757 with SMTP id
 x134-20020a25e08c000000b00b8f3647d757mr2077276ybg.11.1681411012075; Thu, 13
 Apr 2023 11:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230413140138.348137-1-amiculas@cisco.com>
In-Reply-To: <20230413140138.348137-1-amiculas@cisco.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 13 Apr 2023 20:36:41 +0200
Message-ID: <CANiq72mTyMzJVMEAfNo9TyevN8jbqV0L=ba8=Ym-2Oxhm7oniQ@mail.gmail.com>
Subject: Re: [PATCH] rust: Add functions to create and modify an Inode
To:     Ariel Miculas <ariel.miculas@gmail.com>
Cc:     rust-for-linux@vger.kernel.org, Ariel Miculas <amiculas@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Ariel,

On Thu, Apr 13, 2023 at 4:15=E2=80=AFPM Ariel Miculas <ariel.miculas@gmail.=
com> wrote:
>
> Add try_new_inode function associated to SuperBlock which allocates a
> new inode and implement a few setter functions for INode.

Thanks for the patch!

This seems to be based on the `rust` branch: the filesystem
abstractions we have there are not yet in mainline, so we can't take
this now since `fs.rs` does not exist yet. Please see
https://rust-for-linux.com/branches.

Also, I haven't reviewed the patch, but some quick notes below that
you may find useful.

> +        let inode =3D unsafe { bindings::new_inode(self.0.get()) };

Please follow the coding conventions / guidelines of the rest of other
code. For instance, we require `// SAFETY` comments on all `unsafe`
blocks. Please see https://docs.kernel.org/rust/coding-guidelines.html
for some details.

> +    /// set the field i_mode of the inode

Ditto, for docs.

> +    pub fn set_fop(&mut self, fop: *const bindings::file_operations) {

If this is intended to be used by modules (as it appears to be since
it is public in a public module), then you will likely need to avoid
referring to `bindings::` so that modules do not need to deal directly
with the C types.

Moreover, the fact that a safe function takes a raw pointer raises
some questions -- what happens if somebody passes a dangling pointer,
for instance?

Cheers,
Miguel
