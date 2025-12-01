Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5BD305E00
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 16:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764607289; cv=none; b=nmxtUhkX4VNLsK2l0sn6AVjvXrtIij12e/K7O7//Z26sHRGTjAO9n+G0hEhHjzoc9Zj8r0+kiw2hqvxq8KGIr01HvjIHycW/UFZMjxiBmx3hBf7kHJvr/Dc0ZgcSP7ooz2u2uZBFbvweDFQyHmCUJPMcLw4b1CnuV7Rd6ld2c4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764607289; c=relaxed/simple;
	bh=XUmR2wfHbxbQRyahZsUJqUKrgvOGlZfO4mRkJxVrtkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4xx0AkT2mbj9i3zBmehgKm4HNW9DGF6wmoM/BUhY0yOfpQ5/ZY07Py0gJQmdKWVEFB4QQaEoV0QUQ75Ml3xj/0Z82SfqMlnz2fDNtTtFdkj7TVmJbLfPX6Bc7w0xNOfXocB1yH+KZtpXxKgVTbb5KSmc1jNW7fEea2sm6AX0ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HrjBm6ux; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrjBm6ux"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-298144fb9bcso43541735ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 08:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764607287; x=1765212087; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nsNFvpyrWGxzJktkBjM0GDgeDCSAwgo15N2Rah1UbYI=;
        b=HrjBm6uxlWLiJwenXycC+Lrp3UNPA4VQmJBsoJFOA6yHjd/z3VNS7Q7URo33PezaEZ
         ErEO2sPpsP6M26Ujz3Jyu7eKY7CrHZw8uQKNtUZd8wJn7ufz41IQ+mnmUJLxEgLZJUxJ
         CUmUZkk2ASgCVhb0T1rkvMkyCMjpzTRMDiMATjvEk21IWWocd4B03ye1ZMPXHToMAyOd
         VD2WDOe9fJ5beTegtGj8oYnLk9uoocZWpLBaYGMA4Gzk6TJ44q6ChxxfRlnft8JRLQVu
         whSXzi2Bwu7bI6fjQMYGr8mKstR084ybzzvVdEq7wjNplJauZM3zC6w9dRK0iYbjhlJM
         XThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764607287; x=1765212087;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nsNFvpyrWGxzJktkBjM0GDgeDCSAwgo15N2Rah1UbYI=;
        b=i27Dth6zPJp2aH7dLLnzZw2mjoDOoenUfdiohqJRATZSw5G1V3oNclMNvWjTYok9Lu
         VGPP5mOGz6M1qkVTDIJ7524B8SbCx3DBhzHo3XqMWZcmG5tsU7hxaJhcpWwpLnsp046o
         CbTDCQiEOFcx6KOUlB4DwpjUE9VjTEIOOxQkbzIEEda3HOFek+BbpUoI2YxcyV1ekJap
         tKA2ks8G74F7GQVlOyKmPomfkN0OvYzv8VDNbRpYQis3fQsiT1n+dxbvWiLfaWxAhIKP
         VPf/nNVOcom7v1gtDIj1+MG2cvrodslcERp2aJhEKQcT6dRfg9OSJpyyKy1KfFWPylof
         YltQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOj9Ga8B62jR9mRl2FhVUjV1rnCbJIlRdtLbE5meeebZx7/lrsaXp+d5EvtPWjuSJ9GA65SujS6UFNNut4ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuDCWxMlJ5pOrrnrG13VpIP4uifja0ION8ctSr++9penC4laHG
	AdIgJLvtOC3FPeZkLaTWOEpDPCs0hQ6qPFRGb1WFGlh99Hjdkvm0lAJh
X-Gm-Gg: ASbGncsN2Ff74HvtC/CXqNz+ZhTtTpmSanYS2uwL6SjZIcL386Xox660DXdtKM0IkNo
	BlMRopJ7V3PDp9OoHwNoiAFO0wv59oDFRj19ulia2kgf+aB1SqXjAGJW00foAIU6Udqp9BeyjyZ
	5hS/58GCtcGXKycD3YZz59Fco79d0yAHTfjkx8X2ebwhf9JBQOFMdaNfAJAglvSTQnnFGOHFUOT
	il3qBdh8A7nV6V5tgxR8fKYQdPX8Ervx5oywlS+NJHDCq5c4/SwIjp0e13UtC9R+gZoX4xy8oUI
	vbFlnyLBQuFSIc70yRXD5aqHriWsKJvUdZgANfqeVXX9y3MLY4HjcdZY9nZ1gTzOLOqNuDZeMz3
	Cz/y9yxGKsla2q9zaVOAsYEyu8TSNR9fC7YuztWLsMItYl5IfzPKuSuogdxUWiT2147+O3Dwtyq
	WOM2JQHfc1AesLLVZCbtI3Q39REv8T21WLb+qXc9cMIYiDZgdDNuvT1Kk0s41g2Q==
X-Google-Smtp-Source: AGHT+IELnpBhVvAKBiZfSjTp1WSUwD6F40cumZstvRzADgthJTN3qJbqC7kl8No2Kn2EqGlrHmpfmw==
X-Received: by 2002:a17:902:d4ce:b0:295:5da6:5ff3 with SMTP id d9443c01a7336-29baaca4394mr301096265ad.0.1764607287244;
        Mon, 01 Dec 2025 08:41:27 -0800 (PST)
Received: from atharv-HP-Pavilion-x360-2-in-1-Laptop-14-ek1xxx ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb27764sm128578905ad.59.2025.12.01.08.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 08:41:26 -0800 (PST)
Date: Mon, 1 Dec 2025 22:11:09 +0530
From: Atharv Dubey <atharvd440@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Charalampos Mitrodimas <charmitro@posteo.net>,
	Yutaro Ohno <yutaro.ono.418@gmail.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Borys Tyran <borys.tyran@protonmail.com>,
	Daniel Sedlak <daniel@sedlak.dev>,
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: rbtree: fix minor typos in comments
Message-ID: <aS3FJb9uRdsi70u3@atharv-HP-Pavilion-x360-2-in-1-Laptop-14-ek1xxx>
References: <20251201160715.25991-1-atharvd440@gmail.com>
 <CANiq72mkzeDTHuwdTSL7cy+z=nzEHA6bLYUUFOSU7RwFurDq1Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mkzeDTHuwdTSL7cy+z=nzEHA6bLYUUFOSU7RwFurDq1Q@mail.gmail.com>

On Mon, Dec 01, 2025 at 05:12:33PM +0100, Miguel Ojeda wrote:
> On Mon, Dec 1, 2025 at 5:07 PM Atharv Dubey <atharvd440@gmail.com> wrote:
> >
> > This patch corrects a few small grammatical errors in the
> 
> s/few/couple?
> 
> It is also not a grammatical error, no? i.e. it is just a typo within a word.
> Thanks for the feedback !, I'll update the commit message according to
> your suggestion. 
> > Link: https://github.com/Rust-for-Linux/linux/issues/1206
> 
> Thanks for doing these; however, since you already did other "good
> first issues", please do not do more to let others pick them up :)
> 
> It is why I typically write "...to use it as a test to submit your
> first patch to the kernel." in the issue text.
> 
> We can take this one since you did it already anyway. Please add the
> Suggested-by tag as well.
>  Got it, will keep this in mind for future contributions. 
> Thanks!
> 
> Cheers,
> Miguel
