Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B08A4A21
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Aug 2025 12:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755001493; cv=none; b=XLXVJaxXFAjzJYkXWK+BwPQgxOl+qB637+UjG50ZJyF1n7l7JvdTbNJp0qbWrJR8NDV/ths7fvrlxrl/wULnIPIZ8ZgywAZdjwOM7XJjS5Dt6FabJ6gge0rZCelZLvrAI4H2do9Z2QmPKtdk6xKMc10tI4prmm23w680SgbKYBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755001493; c=relaxed/simple;
	bh=oTY+2UrW6c90n9mjD/VMKLIOW0yTa8G4byI1ruteOUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hga8c4sd46pDgLdbM2Y+9hz7mgHsp5tf/WgV6anH5MlakzdkoVNIMS5IWW94oph6UZv5VZtrM2fxaiBG+avn19PXZeq4ky7xemoybvRgTgieNCqQTr4sZJaFWGazDKSluRbTMmqzyNgkCX46f6clBjxxV7OP1BB9nvUHaalbs+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=trevrosa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=trevrosa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-af958127df5so31201266b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Aug 2025 05:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755001489; x=1755606289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTY+2UrW6c90n9mjD/VMKLIOW0yTa8G4byI1ruteOUI=;
        b=orTnbBcJTBK0QXtw5OoPh0hSaGJPvbJOtKQg7O1t8eZOyvzm7+iEA3EyVjnZN17FWq
         ZHLQ0w+1yHWizR295vcvOOKl2oQEtLQAcN5E1WhJXgsIiZwx1ZWjLPV2SjLhSPcxf8SN
         xQh+P/1lsG1ZoZjj90XK5W2iQnJrMR10HbZ7zoFemzCrj+ICLck6/jGf0oLKDIwT+B7G
         1CbOV4tRfiUC4VPPTrRiRvU1Xa5XtbvfVBwdd66HDIvq4IPuETb2+7tVkv/T3YzF3NdT
         c7RxswLp0WY15OjPSl6uwtfZpIgH/Lgq12gXxkwcm3EV9aQiaf1YK6wu9C9ofmUjJoow
         Pu9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwEiFFLPSR398Uww9RLzhLRf+bNCPmyIc5WSF7lFr02CFzz75ZUUEYHE8tseE83HRkpm6b8bl1vrqXBUd1NA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt7Ml7wlseNz2gmkcaRCn41MVgGKJi+8FJ34GOdJJj730eE8C2
	gCgqwU3H0aU4nQfuf45s5bzDArexvC83PJmMQf3XIENIAqXpX98ixgsXZ4Ab/p8R5Rw=
X-Gm-Gg: ASbGnculqqiGT8U4CH5q50/V0K/t4ApD3e85LYCoZI6DalZ5+FFU+8yNuWn1bJvi5jz
	upYAkZ1yY2rjdVgY9UbTXnl8B98rc7bfKx38eaU8m9q9z7d1Njggyc9bcxh7wkaxm/UKne1HWCp
	9oh4w7sik6icw8nOWWL0uWyWdLhJ5CkT/Ldv+OvfOb6FnbGaZP19fjV8YZLRF+7j1bPH5B+SyTI
	k99mfwkmAqRoKKCZl+D8WEhj+4zKCYqn/1yiHIPPz5SYOPgD0pMdmE9IDL8xqX3K9zapNPfyUpj
	1jv+9WXWcHL6rU7S76+pbQnFTN78P5ueORHiPk105+4H1ZsXIFYwJWeGQAa+nlRZxOIHhWukIS6
	fbD7gf2okeNcpNiN9ZHr9yKblsPkOxAiG0q8y7a7w27C1tx+oEaSvm2dF
X-Google-Smtp-Source: AGHT+IFzkO2m8nznMFrfYnTOI0LKfX7jz2hjZDOO+CWjTVSpckcPAuOwJBABw8aAm72c486LO7Sf/w==
X-Received: by 2002:a17:907:cd0e:b0:af9:3ad2:6930 with SMTP id a640c23a62f3a-af9c64859a3mr1450237466b.24.1755001488784;
        Tue, 12 Aug 2025 05:24:48 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0e7sm2192176466b.114.2025.08.12.05.24.48
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 05:24:48 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-af98b77d2f0so1005055166b.3
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Aug 2025 05:24:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXg8l3eHrVmyt0tRTKkswHhr+u6jFG87vGhE2X5dNoifsXfXgBx+bhr8wibZ628TsfbOSK6Il6ySPaazwxuBw==@vger.kernel.org
X-Received: by 2002:a17:907:6d0a:b0:ade:4593:d7cd with SMTP id
 a640c23a62f3a-af9c6452605mr1626136866b.13.1755001487525; Tue, 12 Aug 2025
 05:24:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACvsgUCBk5Dt2yBSy9_NA0z38-wP68vvBX7XDYgJGinTURT1kQ@mail.gmail.com>
 <2025081221-cloning-able-a6ed@gregkh>
In-Reply-To: <2025081221-cloning-able-a6ed@gregkh>
From: trev <trev@trevrosa.dev>
Date: Tue, 12 Aug 2025 20:24:19 +0800
X-Gmail-Original-Message-ID: <CACvsgUDP8rX4evCbaNC1MTy56qWH655Cc2bOLuryUxfP-o4_4g@mail.gmail.com>
X-Gm-Features: Ac12FXxNrrCQv1c7ANW16tWoQQ5X4SPRt8GFNTCCYsGLFh5jxY_MKIqIBRUGaWI
Message-ID: <CACvsgUDP8rX4evCbaNC1MTy56qWH655Cc2bOLuryUxfP-o4_4g@mail.gmail.com>
Subject: Re: [PATCH] rust: aref: make `AlwaysRefCounted::inc_ref` an
 associated function
To: Greg KH <gregkh@linuxfoundation.org>
Cc: alex.gaynor@gmail.com, ojeda@kernel.org, rafael@kernel.org, 
	dakr@kernel.org, arlied@gmail.com, "simona@ffwll.ch" <simona@ffwll.ch>, 
	"aliceryhl@google.com" <aliceryhl@google.com>, vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, 
	"viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, brauner@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>, jack@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 7:56=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, Aug 12, 2025 at 07:09:11PM +0800, trev wrote:
> > `AlwaysRefCounted::inc_ref` is a function that shouldn't be called ligh=
tly.
> >
> > To prevent accidentally calling it, `inc_ref` is now changed to be an
> > associated function.
> >
> > Modifies all `AlwaysRefCounted` implementors to work with this change.
> >
> > Suggested-by: Benno Lossin <lossin@kernel.org>
> > Closes: https://github.com/Rust-for-Linux/linux/issues/1177
> > Signed-off-by: Trevor Chan <trev@trevrosa.dev>
>
> This doesn't match up with your "From:" line :(

Sorry, my bad, what should I do to fix it?
