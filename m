Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2B96FE20
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 18:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711390959; cv=none; b=nTGXkJWn0h9DFXto/IJUzAek74pZ8GEoFJ2Xokg5Bht0fy6Pn5YcdWFKFzzZG93hooGh/IqiDnlFqZPC65Lw5RY46yUDzdHDXXI70krYdIUW6OaZ9rI35Em7YE2y9/XGM5FToBiAuqn3btW3m3pOzTIy3eoUIKhTz8mKtyZeUNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711390959; c=relaxed/simple;
	bh=0escmZc5GzhLzzjrvl9tLBJEaqKdJmnTs+6evsE/GRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KHR2jEj78RA2LQdHkmpqIgpnAhHpb43yc6jDaomjsZqOVdU2zp8NXJvNlmbc+MCppPkAOvpKI3cMzs9pw4diFBv435SdjdOgXl2YiP2dv2zjZc8EVv/3kypP8jPUd053opIaYk9jGwraSdUyJeMxx66wShid5R6dZCwspRfHsx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BgzWmMaw; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BgzWmMaw"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-29dfad24f36so3125989a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 11:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711390957; x=1711995757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ux0poaCYoa3ZmIHBsOnX5z9dmmjikNAaeJNsLoEyNeM=;
        b=BgzWmMawa7P1RmOsoDu6i9hfp0B8TdldCAGs8C99baEaq3RKTIpwA7HLm5vgYCx4+P
         sazBH3VDOOpwCtkVyL7last1rG5kgmSFWcks6yJkDZINLBMeIU4dzksndXslvpLAZPwv
         +z5bJYNtDtkRl3dPpKGZ85awCeqXJVpkaMYAJay0zGJUpsVnkjmzlbkYp8wPLb02CdbJ
         Qciksw1errvAxyKMMhA5tXyVwMdNEXjEhjNOSf1RnGvHzZ+FAy5DGqiXhs/zF/fOR5Pm
         gew6gTo3kxTaWCtbYamX02GDqyg4rDxUa6R4KxLygw4EwgGsG96DppEtjGD+kIQLHpXr
         TL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711390957; x=1711995757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ux0poaCYoa3ZmIHBsOnX5z9dmmjikNAaeJNsLoEyNeM=;
        b=pQi8S/BVKR64MpdyvPBZcc/bvcyJe4lBtJ1wK9UGdU1SlsoZzserTQmUZDlFJOPykk
         mB+t0X605zKs5OQ8rvHxSEL3VUGtpKLMEYah6Em2e3wp6zCjs6wptEogkKYpJidSPOur
         uoB2FVhqvDqCh1SyPdxxs0Eqo6cpp2DV5oqy4Txta69RB0uwfCL9jnQy8XQmWqrF5Epc
         XeOeeAnxkVvs+pB0r3ZB8ymB0XDi/SFdYL8nJ5NiQbKny4qSHbToeo0koiR78q7ex5np
         M0znPnolyUKTvBKIKBGwqxFPae2brCo0Ak4H1Wt0ADNSh1Knhq7cgqICi+B9I6AiKWzM
         uT6A==
X-Forwarded-Encrypted: i=1; AJvYcCUCmxu3HCN+zjwmqs/oX3TdovPXdaIeDdiyLAbhhtinwrVN8hz4ML04NbnjIaIIVcmP0Xljmwn7/4b2lt5QFM2h2m8EUQlUzJTqsmaT3z4=
X-Gm-Message-State: AOJu0YypohQ+niDzths/taXMWg41UAtSXHQ32G9f6kRTSQnVf+wHfh7e
	JEyqhlqt6068IGJDp0/n8Y2FRM7TmKqnSoSHNe1uvC7LHe/ZpxPJKeTwJQQVns/uS9Z0TQBlp5g
	02msmyoIt9o8+w1zKGc+9nACBcIc=
X-Google-Smtp-Source: AGHT+IH1Ugp7MpRJ5m0ROmcMMAkj/SbyoIWQtOvdJbjm/Lv+bCPqnUn0tgV9B5nc+55igi8zEogNWF4ibCNQ3663FD8=
X-Received: by 2002:a17:90a:fa96:b0:2a0:46e0:8577 with SMTP id
 cu22-20020a17090afa9600b002a046e08577mr6577465pjb.34.1711390957141; Mon, 25
 Mar 2024 11:22:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325174924.95899-1-dakr@redhat.com> <20240325174924.95899-3-dakr@redhat.com>
 <2024032501-unplanned-detergent-4357@gregkh>
In-Reply-To: <2024032501-unplanned-detergent-4357@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 Mar 2024 19:22:10 +0100
Message-ID: <CANiq72mLOTK_3gbptdjeG_CCv83Fn1-xEWqaoD=G5AsxXTV34g@mail.gmail.com>
Subject: Re: [PATCH 2/8] rust: device: Add a minimal RawDevice trait
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@redhat.com>, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com, 
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 7:14=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> As fun as it is to bury .rs files down in rust/ where no one notices
> them, I'm going to ask for this to live in drivers/base/ please so that
> we notice it and it shows up as a first-class interface here.  Otherwise
> it's going to be impossible to keep in sync over time.

Agreed -- it is a restriction of the current build system, I am
working on the new one to allow things like this.

Cheers,
Miguel
