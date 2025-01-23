Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210C385626
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Jan 2025 03:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737603844; cv=none; b=XIrnYHXhbeCihvRnnFsQu5G8ayP2ePq0hxcLT1oE+XCMZUqTaLfNiG23pcqB8Lqd64ITzsx3bIR2N4Pna1KxwkEQ4As/7cR7aESJSTUdIkGcaj314p3SduODRb0vNCScJfvrRFBEck/BOzEpP8k3RU4a+FScefJ1UwO5mEeLEAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737603844; c=relaxed/simple;
	bh=70QXJ1fUDSF1/EMFEoazUOtCExyx/cHHDB4wx0+O1s0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WK6nTL+Lq6r/EzuHcnqEyEKYNixZ7pjIYVKVfmiSvoS8vIp1Uef1aRg+mQOeJcNPZarvlqZM1o0kegAMmu+7I18G4aYw4aHIL74/mryF6dXHdAZDrny19uLOLk+ZBQerIV+cuphS6PLZAdxip82TDgeLoLonrTuL6RBBj5XA9Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GdNeMPoE; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GdNeMPoE"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ee74291415so682619a91.3
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 19:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737603842; x=1738208642; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R72c6XuQv5WvOJOqP2KYpXDCD+4Gn1lpWJ4fFcfXZ0o=;
        b=GdNeMPoEx9udRn30HmlRgZucp4Gy4UNCxLxRyTyEiisFkaChDbFQKzX2592E9WiZnP
         7RkUXaN/uzhuuW80dGIwjPRZAxivXAp3VpF2n2rWT48qxBpIX+WJktUPng6jgSyv2WYA
         aLz9ss+AW8q+TJnWqkPvX1E/vNbLtvpVEfZ0Dy5+KGEuzyGjwX6MoNJbQDLJjzCy3VGY
         8trbtpTju+5pDd70DAgUHURYfBWpt6Swi7pQYaY3jONbwh0l+TBvKKy4VuHRoHKimRK1
         VB5Nb1rdis/8AWOwuE/Hw9zKOZpqtC4DfUs+2RqZZhA415ITgyAdcl2jOLgSfyclTRra
         RfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737603842; x=1738208642;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R72c6XuQv5WvOJOqP2KYpXDCD+4Gn1lpWJ4fFcfXZ0o=;
        b=lWqUUCDAKEmZE8xAEIRT61YqMIMYv4HPIETTRvPiYmqrbHNOlRk9F1elq98vplp9n1
         BGkwm5LDZlasX5MYD0BRDq2AE9PviZShBDP4pJCWRWydgSVMqWlMwOau4Ad4Pv4iWLim
         E1UIsAr/rTMPzHzvpQOe28CsXn/DcqpkJr/dKO9BNax3auaesgNemgKo77l9vR+KgioS
         3L5gNBv+ewasapRtwGZDFvlgzMuftMxorxYFfiURLRAYTruEF5faP9PgoHjIrIWqCDDj
         JG+oIfFkFnaxz/hHys1xfX7KNOSmOo7zsQ2octVkrdMyJkmJiaZpCV9CykTn5fck6rzB
         kErA==
X-Forwarded-Encrypted: i=1; AJvYcCUhJGqH9wn4y/aShwX8QdJSE21bV4gVSCrAgmYM7jc1CTiQlD50DSH6fofs1d6n0dY6UF0uxUOLOc07Fz4X8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzyPYAlcATZzlfsMXIP0lOh38zFvAstWi3iDnxAVeZc+k6p/Xv
	OIiwF7DAoJ9K8gDJiis4Aap+f2C7eVhQVscvv5rOwqbjsMRyp/0wcMGCz+CV0E0=
X-Gm-Gg: ASbGncsZ5oMGkuzGIunUVC4oK4xXjkj1VYZujnvo6XXXOF1tyRc7R44PhnCWUnNOXP7
	DVP+4z3jlqjlERAXqNyrTzER4tUotcJbsfIBGD9UN7rYb12HSklODHk+9yXtCTy2Nluts/GZ01z
	VWR6IR5FY4mgFAiKwR5YcEtaPMMs6jYNGH9PsCIHpvoiEsH7IqmRQvk693PS9Fsiw38jlPhLlEM
	Q1kD5j9bLfA3bLfnQmMSyo8EiWdU5Tjx1tmzXALbNlnDsESsPLIgdkunndm1ef39sZANZ5oIdCD
	q0mL+2k=
X-Google-Smtp-Source: AGHT+IFYMjUGvNd0ZVMIg8ZM9TNP3wdvfJpc+nt1WjZ/r0Fm5w99jQ04/Kks0iX0dZ5f2Icp+icS8Q==
X-Received: by 2002:a17:90b:530f:b0:2ea:5054:6c44 with SMTP id 98e67ed59e1d1-2f782d86491mr34109958a91.31.1737603842385;
        Wed, 22 Jan 2025 19:44:02 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6a5e30csm2570979a91.7.2025.01.22.19.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 19:44:01 -0800 (PST)
Date: Thu, 23 Jan 2025 09:13:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH V7 06/16] rust: Add bindings for cpumask
Message-ID: <20250123034359.pz7w64fyr6fopl4r@vireshk-i7>
References: <cover.1736766672.git.viresh.kumar@linaro.org>
 <4f233d3f6d593ba2e1cdde68af44200cae74f6f2.1736766672.git.viresh.kumar@linaro.org>
 <CANiq72=o+uc3ZnNrdkuoSGSL8apNE4z4QwpvsiLfGzXFywSLrQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=o+uc3ZnNrdkuoSGSL8apNE4z4QwpvsiLfGzXFywSLrQ@mail.gmail.com>

On 22-01-25, 15:40, Miguel Ojeda wrote:
> On Mon, Jan 13, 2025 at 12:23 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> >  rust/kernel/cpumask.rs | 85 ++++++++++++++++++++++++++++++++++++++++++
> 
> BITMAP API maintains `cpumask` on the C side -- Cc'ing them, since
> they didn't seem to be in the loop?
> 
> Relatedly, should this have a `MAINTAINERS` entry?

Updated MAINTAINERS for this and clk bindings now. Will be part of V8.

-- 
viresh
