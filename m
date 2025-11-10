Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA5B1E47C5
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 09:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762766526; cv=none; b=U5pHRZDLxFZqNmltMeRstfAl9nkRLTVPaCr5+Rfeq1qZDFZ7X9a/lyJOhoDEB1UavG1SX2HhxWvrkkbH9xprYadpHKZSi/YInc1Z8QSeObCB6NoPtljwFcDYLA+CC9nkGs9eRKXaA91+g0mIYkU9loB78hBDB3qWejBn/6kt5NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762766526; c=relaxed/simple;
	bh=CQM0BMMrK3H4GUwbM3ik3X8qQz2Y6rSQlQwSYgJMMO0=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Iwt8kOvCXIVVTTb1uyJrx//D1jTJpiLPnEWBGrdkK3Ru1BK69KsbrK98sDkpkMXnCg+FkcxQwVVI5SVpK68/RxMjnCqLNNcGoExTDz36MybBRsF6AmWGoFxMGRQvxR2YRaCX6Z3Qxpw4gzAHVYCbrd8ilnf8RiRqP8+mNJlfbPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1hI1/Wd; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1hI1/Wd"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2953ad5517dso26415825ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 01:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762766524; x=1763371324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=URqCpwoIgMhuE2NL38otxov0v8bxV0wkIHekKuiYCog=;
        b=V1hI1/Wd3Jb4lkRnKbsoDFkX7ST/GN0INYxu0uGnnsjo0ewqGnrAmwFjtmRmnG1K7I
         1tL6iac7Z9Z7+zL6948dVS82yjOATeCMLZ57B9jDKQ2bvXNlTrV4jp91GHB2/2Js9T64
         f9wPj6vxaNzgZuwaH2ADPutHTNYmA5sWH8aRwv1BYLQQkO0KS1hqy+lUmTv9UThPu+yI
         k2l6CdWZ3Okt+JyM2JEcDQm2NxBg+zymz7dDcfNeMyNWvMEV9l3b8OSqnzQsE6KwuuB7
         TyOO75mYqTa+wgGumsZQt0wca7zfLjP1k9Ba4kQ/gQIQmaW6/CqBO55tTsuNP2bhIjg4
         hxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762766524; x=1763371324;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URqCpwoIgMhuE2NL38otxov0v8bxV0wkIHekKuiYCog=;
        b=nF6ukqTFQdQfjFohw4U1Iitq4DRiAdlbowpLXzJl0YmbKnd1YWY4qLDoNpcHh0GIPP
         U0n9Q4sRZiaeWqSy+yA1oMeP+F6cNCpOLEvR/gn6nThprfwnWhd+ytgAByDFwOP4ahUU
         AkeZvT33mDvwbTSy5NR9PirJNjkFV664aWRw3Za6bbbN/zC0UZIMz0/nKi+yVNqYIiJV
         IRWkHCClSp+xgliVxJ+U+wUWgz2s/fgDptyYskbWZP5yZ4frxVISyFhM2VsZO9cwLJ5O
         Z7vBQKkzxPBm5A4C1bxjJdEHzB8QCvUocQDacJfUiX4Y7xEze5ITX3Jeqg0VSOMODdUs
         e0jA==
X-Forwarded-Encrypted: i=1; AJvYcCU5KZ+7mJLcMyIisA2DyyHGpBp/p6AZjioZTTLlBP55Sl/BwtDmPfMYwrDpftFtfY/0UHdlpfXbCxg8gscUlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMK7wA8iGw/3NPiZerIyGjTNF903QYvmBI3Q1md5fRM0l2/tsS
	qfdtsg8VTjLPN6eF0iM1PuEtvad4JhSASlWHvihv1Vjn+DfPa/kEcxoW
X-Gm-Gg: ASbGncuftImx0ep2mjTnys4Hrl6vkk1o6q7ElqnQQVkEsB7Uw5wfDbRcYEH7YDBgbmH
	S2oitRxCdsq3pmv3LGe5ZP/O9m5G4pchsQa5430LkHtoSjTn45g3uuN0xJsB0f6e///zyk8ftz7
	WHRRNzv0lS6k7xtrmC/kVx+skfFZY2rhiwM32iWZtsRzNNAEY2sldzkQFrlMFClXJVS71Yb9h+Q
	OSdVr3a/WxEJY/uQp0aEaHuJvpnNMFewHv0zVw0hTDX69w6HwQv1mk2R+NAvpNyd3dBSS8asdqF
	slsN7XxGYrPNlMlTNQhVwufiggqV6XbjWfQqKoNuhUErSw1lxe8wMOee0cw7Ki6XMnW/fHa+DVY
	J9wcrzCzxToaovf5UbGIsBsm8yFzx7ao5ulp9F1QRy5vxcI0q1VocuJuRlcuh3OuK905+rIoH0G
	PmoN9+NnyjKa31EIwcPnhY87jiuAKQg5W1Vx+L/bRgumBpTRA1/MtP8A==
X-Google-Smtp-Source: AGHT+IGsuYiYBj69wyJc4ZAcFe88ItcMQ+69TwQ3km3mzlP0BX7xcDEhXkkNy6/JByP9xuBXPkhFkw==
X-Received: by 2002:a17:903:19e3:b0:295:ed6:4625 with SMTP id d9443c01a7336-297e56caed5mr104585375ad.47.1762766524502;
        Mon, 10 Nov 2025 01:22:04 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5eb35sm138792615ad.38.2025.11.10.01.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 01:22:03 -0800 (PST)
Date: Mon, 10 Nov 2025 18:21:50 +0900 (JST)
Message-Id: <20251110.182150.1392834304602894143.fujita.tomonori@gmail.com>
To: aliceryhl@google.com, boqun.feng@gmail.com, a.hindborg@kernel.org
Cc: ojeda@kernel.org, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function
 exactly once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aQ21xajAygTbi582@google.com>
References: <20251106.091026.1308953895982406095.fujita.tomonori@gmail.com>
	<aQy0zxs53EAnntwR@tardis.local>
	<aQ21xajAygTbi582@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 7 Nov 2025 09:03:01 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

>> That's my point (and probably also Andreas' point), we already has the
>> type `SetOnce` to do this, no need for a `OnceLite` type if not
>> necessary, and the fact that it can be zero'd by debugfs doesn't change
>> it as I explained above.
> 
> The SetOnce type doesn't do the same thing as OnceLite. SetOnce has
> three different states, but OnceLite only needs two. I don't think we
> should be reusing SetOnce here.

Yes, SetOnce provides three different states and the feature to set a
value, which are not necessary for this case.

So there are two design options: 1) to add a new minimal
implementation that provides only the features required for this case,
or 2) to use the exisiting, more complex implementation with richer
functionality.

Could we make a decision so that we can move forward?

