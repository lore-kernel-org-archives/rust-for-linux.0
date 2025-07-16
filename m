Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB04F165F1A
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Jul 2025 04:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752639318; cv=none; b=RTkcyhO32Thyh9JTTLWjGltpy35n7mtvn8netQFUslBH+31/C2krnJ/ywuddyqFGabxlr/PjEKzzH7Nj0TsDVzmpbXavA5GFkWTGKEVg2UEm8gP3LPRIo8liyGeoIxkuONUDH/4rRjXp1QiiaDDyktAGh5bJRzcdbRqC3EPVI/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752639318; c=relaxed/simple;
	bh=S4xnHKXRwYLF4Bc7MmEM+6xk4hyP7qx9fHNjVVZK1B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u231wkeSVAoNAZzNK5n3ztKRnP38a0cxYxK9q3308ey4ComYdJL2orInbHfTwxYpqKYlqTmjvs/9fXhuZAReJJHTndyZkqpTGQ7IGg26xfMWr7onnOXnbEEDY6aMz8PpR12u8QiTJWd5XhuS5gSnJPdHFX+/25dqeQ66G8aKfy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Te2femfr; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Te2femfr"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-74b56b1d301so3648061b3a.1
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 21:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752639316; x=1753244116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B9ALtsP8cs9O1e4maZZ5/2bYb4D9S2uHQauOE4k6BnM=;
        b=Te2femfr6RoTPowjaI0POT914ynMmKHoBI43RVYVs5D1g75UkRmnsKw5gY/v8CduTd
         0g+fVDzRuShU2V7yjNuzSZCxPa/kJQ/54dKFPJdsEuCFklBbjHbQeH1qyntnJjONAVcx
         UeW/sRWb8IQNLrvXlGq9O+Jtk9h2BVV0vgAuICV2KCWNjgWvtpZzUmbl8jPJehcum07p
         8UqoYAHjBNPpf5r7NYAfh8v9xHjAc0ssvKmimQy1nHy5uPssNALc0glFHJj61aBqzj2X
         0HdPpqptAEuik5RXXqi5Gw8vYFYBOUIRIBdSyE7y2cUWJFiScusJy8XShTKbacwVZJOg
         DZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752639316; x=1753244116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9ALtsP8cs9O1e4maZZ5/2bYb4D9S2uHQauOE4k6BnM=;
        b=LYRa34Ep74ncqAm8jD37fUK8RMJPchr4tzhIrE25MERroD79LtZCMCprus6EJ7ftC+
         sPo0tMkecQbfsgrFCeUvj+xk/epwOaaO9t+8cZ78bX22ekaCHHnbxpAO0tIDA669pMo2
         fN6OBKpDfqaeMsI7FuRB5Xzydkfv9rNV90Pda9IqhiYZTyp7iVqxgfHlh7MsEtK2lxRj
         XZlZ+F0qpr30xiSLsGXCtNy6D7JztPtMFSc+nS7OKWg+Y+fIRoa8rzFPgHdHebAqL6oY
         BVm74mGkySiUthLMINXS74XopVkIumsKysEQHBlhX4lsBOelhkG6nVFb50lKo+OPi8K7
         LkRw==
X-Forwarded-Encrypted: i=1; AJvYcCW6u0RaZR4lSSz0fxiNJ58wi/+rOAi9IIy8vyv15CdUffdYtGkdIYvQK5kDsSatDexLTqyM3kW0pZFp33Q3Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwG6CiJ0R0IUhhKuBqYxodLbqr7Svx2bNH5vQIrMGK0GE0xcA/b
	RKlACnxc/0CkQ55nxSuuN5MuXg9YZ5BclCstFDtKUH14gPXxXdCJ3CSRrLxf9Tk6T+o=
X-Gm-Gg: ASbGncu2twhJhSEkheLsvC0DvDHxy/lKU9EE/clFqtKLNJpmu/3z3jNCXTITZ6P3X65
	tPL/zfUP6NU3i78uXlPadhGal5rzYOvHUqcVGTh61oOwekAUo95CstwQQyUs4Mo4Ouv6B8YjryL
	Fw9CG7MepdsE7+Ixsu0ky3ZGC5IpSfdmLNWjHnruk1tVqxhuALGecxzJFXP5eFV0yS/b9YWlN8R
	iFLZLzhyLOJwqTfovIrunDSBVD///3OMf0TIMEvTGD5m/MNnStiJNNXozXBhf5SpO+EREImiu12
	hDHFD/HmmIdyIcmPNNAvp4Mh68NvqErnqYEz+uOtqcF3ovpL0h33S1hJz2BU1zte4yDFV4wDDK5
	m3GtqhrCauPQbWU7q5BbGXUo=
X-Google-Smtp-Source: AGHT+IEpeVIWojz8CLSDCsnnK++2HWoZI3WFu4nwbfsfT/+i+PduBECM26hmFwgUQ32eXYYTiC+mXw==
X-Received: by 2002:a05:6a00:2350:b0:742:a91d:b2f6 with SMTP id d2e1a72fcca58-7572466bc03mr1521466b3a.13.1752639315998;
        Tue, 15 Jul 2025 21:15:15 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06d5esm13627952b3a.67.2025.07.15.21.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 21:15:15 -0700 (PDT)
Date: Wed, 16 Jul 2025 09:45:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Ritvik Gupta <ritvikfoss@gmail.com>, yury.norov@gmail.com,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
	tmgross@umich.edu, dakr@kernel.org, rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org, Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH v2] rust: cpumask: Replace `MaybeUninit` and
 `mem::zeroed` with `Opaque` APIs
Message-ID: <20250716041512.vy26zef3mh4xnmio@vireshk-i7>
References: <20250713190244.143286-1-ritvikfoss@gmail.com>
 <20250714045418.4ajeuetnjor4nhau@vireshk-i7>
 <CANiq72nYqOGx7FEfMyp_8VnpZargzZ0uannbO9VMCk=kiEbd=g@mail.gmail.com>
 <20250715030618.ljqvviloypmfixfq@vireshk-i7>
 <CANiq72mKbv-PCv3WA4Mq79Yb2VtrLmxipA_NCaDFdF=JmXS3NA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mKbv-PCv3WA4Mq79Yb2VtrLmxipA_NCaDFdF=JmXS3NA@mail.gmail.com>

On 15-07-25, 13:18, Miguel Ojeda wrote:
> Ah, I thought the idea was to continue like that.

I will keep pushing the changes via the PM tree for now.

-- 
viresh
