Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C386E2206B5;
	Fri, 20 Dec 2024 23:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734738506; cv=none; b=rq6pqcxV9KW2Tg3nBCBZRubU1nE9tLrra/pHnJ1EKiUSoorHKz+VZ96FQE7T28oejgdoVa/Fc1HNmHm4zoyj+SSIJ+M8gnfOy76XXJ2jiZ1+161//8Y5/GBBH0uh6J5R9AxkntTosJtLXhO+ZyZi88vdWzcRAfbwez3n/RUW8sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734738506; c=relaxed/simple;
	bh=iK0W2ulreLsubtQkVYatr8jdNJgT6mjwG5rWATQwCNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KlnJoUMlBo26PWhZ2MUgrdKsrCPpLliCRGz40k0nHPXAiwhIhyTs4X/JQK9hpZAQo4bEFHNNbgctGTsVa74LJ8WMqjv+UdrHgsqK9Wpj35njHrvARjUUsjOev/PJKOCkIQGLgYgP4/Xxy+VG1GzCyOFoSforiJm+ObWa5m/mFp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnShxg0z; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnShxg0z"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6dcf62a3768so21653286d6.0;
        Fri, 20 Dec 2024 15:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734738503; x=1735343303; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YEiaM9yukp34ZRihZk30CfDKFo5YawGYmi3+/ljP5U0=;
        b=fnShxg0zALpbUhOUcCejVBqRFo66Z5yMdLD+k0Y7LqLdQ212DhMDLK6FwWt7wlX+FV
         omFxhcgL9obR/xzbh2r/Z27TQkHyiefeO+jjrCrbYZ7nutzOseKmTfc8mPTDxxOetcN0
         juvB3VUo7Te//0MmsqKGmWxhsgEsk67vyRuhMpYE5Td6LQ1MbnK77Jzf2YxkXOKlq8ve
         DsL1Gc5y8dCTPcX5uTVebPRaIO63pmY9wGfjpwKrdubkbFjoxocExr0w/fJ3JLJRSh/i
         ygjuj9qhOw5GzlAbd+LDFejvSsVgxeGP8I6Au28Uiqyv2kURc+XGlloXkKZyhYKfEO2s
         cw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734738503; x=1735343303;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YEiaM9yukp34ZRihZk30CfDKFo5YawGYmi3+/ljP5U0=;
        b=LHe50eI3+TKtb5t18kmW419Ng5307oJDtgbfb6O+XhuvZPqaDbRbQ/tlEsIGXNIEet
         gXvbDp+sTYVX8/5PX2ljd9E+E+idEMogJ9sEx0UYSwbC0lrrBhMAM64aH8kp0SG/tPU2
         gxfpi0jZsBDh+PLHS6GPS3Iaat+T6IgOYiSulFSC6NM90fFBrmjqn0Mx1fyN3jCVPmO/
         l2RdUg4NIyIpRXUbkNx71wjrRW2MHLvfpUqOAhhaIDeXRtGjD5vIPRVO3p/15aNX8r2Q
         4u3yocpp++SEaU2CtwymJAchtiEAOH621PKCoVJk39CnZeawEJgE6WBszwSUdRsrDdwQ
         CGkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEn0nm9TYcQAAdfeTGjSYtzFDzaLhd03gGehxVemM14LfKCPN6RekbHSWX1LGE4xWwaukkbhD3w39aDKEtM7Y=@vger.kernel.org, AJvYcCUyVTs8xEAbA9NEnOvnCk65/92IyuetA/aZ44ZF+L8MNijzj42Pt5mXhCRBmZvl8NKsSMuQ68z282PRt2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjoobTzk8t2xHOXlteC+/XeElTR3ZV6dM3kpx9EbPAjzH7GHz9
	MdQGhBshqmyq7MhhMvBmqfF+DUjBLuK6uNl3mWCUjpoyW4/0IPZT
X-Gm-Gg: ASbGncsYFYT3Q2p8XJ/RTQKWNZN+a62L7nn9yqQCnPh/rZ6iyDNojq2rHqjLK6ugItz
	MzBfKASjsN718Zr4RoMe65Np0p6Fbi5iVuGa3Un1jHMrfINNgojtxoAVoJ1DjjEPv2GUMiQdk4K
	mpwAD/XrxSUBQYtTIIEWmYUMuIz7uvIhVW8F9ng3MG1atY3Sm2eTC0H0BnYvF7CRhKMQw/CmxwP
	Mjr/ZnZmpiruo7M/g5EMXGqVzrjfpkGQsZ8NgFYZmfTLpIc8gBNn9Fy4WX/7R42AN+PbDTo/zp8
	DpxjNF/JYgdgXZ4lUiFgOBYIyFl/5AWYvZAv10twodZiV+0=
X-Google-Smtp-Source: AGHT+IHrXvSr3QYs/+sf6DmS2WCOhZK4jPZopA5o4SJrQMlZfTY68+HlaJN90Urn15wVKiAXbj513Q==
X-Received: by 2002:a05:6214:f0a:b0:6d8:a1b4:b591 with SMTP id 6a1803df08f44-6dd2334d8d7mr82432636d6.23.1734738503605;
        Fri, 20 Dec 2024 15:48:23 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd181bfe54sm21561776d6.88.2024.12.20.15.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 15:48:23 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9543F1200043;
	Fri, 20 Dec 2024 18:48:22 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 20 Dec 2024 18:48:22 -0500
X-ME-Sender: <xms:RgJmZ9Y11U3I7uUPpuJdIPBOeODIL89Lq1UdscCHeXyAG4hOY5E0Pg>
    <xme:RgJmZ0ZMZC9zKBooVYbKSEpYAD_14_GFVjNi6agca2chef24bWI7VAtRlRCIPwbic
    YiI_JaDDgEtdZmfww>
X-ME-Received: <xmr:RgJmZ_-1I0bZfpB5-wnVkqKo0uL-TlVdbucan8_pBwjiN_G80pS9gpljBbk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtfedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepvefghfeuveekudetgfevudeuudejfeeltdfh
    gfehgeekkeeigfdukefhgfegleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedukedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhighhuvghlrdhojhgvuggrrdhsrghnug
    honhhishesghhmrghilhdrtghomhdprhgtphhtthhopehlhihuuggvsehrvgguhhgrthdr
    tghomhdprhgtphhtthhopehmihhnghhosehrvgguhhgrthdrtghomhdprhgtphhtthhope
    hpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehojhgvuggrsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhonhhgmhgrnhesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprghlvgig
    rdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihgh
    huohdrnhgvth
X-ME-Proxy: <xmx:RgJmZ7oDryAf5iAeNHP1d1Rd8vydR5DoKdoQxhd670M4YzmhEpbNmA>
    <xmx:RgJmZ4p2mR-t5gjFnX1Ruo6eXPF5BoT0eHzYCkONRsxHfOIKBdSvHg>
    <xmx:RgJmZxQR9sidj0QAOSnMmJfbYUib0wLSnpPOKYhnbciCPKOlWKSrHQ>
    <xmx:RgJmZwrPKi28fozVwd6g1Licf4J3jkJVCXpT56Xk_15WzXcPQUfW8g>
    <xmx:RgJmZx7wJUOMtE8t2QNMPw_Zq2IJGCGLqTqUr74Umx6wLxEX25ndDxCS>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Dec 2024 18:48:21 -0500 (EST)
Date: Fri, 20 Dec 2024 15:48:20 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Filipe Xavier <felipe_life@live.com>
Subject: Re: [RFC 1/5] locking: MAINTAINERS: Start watching Rust locking
 primitives
Message-ID: <Z2YCRFd9DsiTWnS1@tardis.local>
References: <20241128054022.19586-1-boqun.feng@gmail.com>
 <20241128054022.19586-2-boqun.feng@gmail.com>
 <a696f18d6eced600972c2aaf1a0f9ae2febeb434.camel@redhat.com>
 <Z1DDuRp7kIm7Pf-a@boqun-archlinux>
 <CANiq72=KA205nyWGxaFpuq-FRV9SXsimCsiZAhrsyX9dA37+rA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=KA205nyWGxaFpuq-FRV9SXsimCsiZAhrsyX9dA37+rA@mail.gmail.com>

On Thu, Dec 05, 2024 at 12:39:44PM +0100, Miguel Ojeda wrote:
> On Wed, Dec 4, 2024 at 10:04 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > Thanks! Yes, it'll be great to have more people watching this. And thank
> > you for the review and contribution so far, nice job!
> 
> Indeed -- thanks Lyude!
> 
> > I'm currently waiting for both lock maintainers and Rust maintainers
> > opinions on the particular changes on the MAINTAINERS file (for example,
> > maybe they want something similar to "RUST [ALLOC]" entry, i.e. a
> > standalone entry). My plan is to send the PR after everyone is on the
> > same page. And you're welcome to send a patch adding yourself in the
> > entry afterwards.
> 
> Up to you! :)
> 
> I guess it depends on whether the rest of the locking maintainers want
> to see every patch related to that (which would be great) or not,
> whether you want to have finer-grained control on who gets pinged,
> potentially different "M:" level and so on. For instance, it would
> allow you to have an explicit "L:" for the Rust for Linux list.
> 
> By the way, as a third alternative, you could also consider a
> sub-entry in locking, too, i.e. "LOCKING PRIMITIVES [RUST]" as a
> middle ground, which would allow you to keep routing patches through
> locking but have the benefits of a sub-entry if you need them.
> 

I will keep it as it is because I do want more reviews on Rust locking
parts from the current locking maintainers ;-). We can always change
this in the future.

> Whatever you decide:
> 
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> 

Thanks!

Regards,
Boqun

> Thanks!
> 
> Cheers,
> Miguel
