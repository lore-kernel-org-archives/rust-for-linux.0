Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F8D2F1FD0
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Sep 2025 15:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759159620; cv=none; b=OM/uG1NMfjmqDqF5SbFeYslKLrclkxMwMOu3h2rcMWCRWcAxGr3WLhQr31nVzx4uO7wP87+SBlRbvng6Bd7qOHTqPk55ovP3VhsjH2YLXpHa5KfnF+LYl7nauurHt3Yb3T4r+Ayt69/yJvzqyMkLGbfeywM0QJD+pYoJz25ugsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759159620; c=relaxed/simple;
	bh=l81tY4NGxQltzYJgqWgsKH1IyY8O4rKYq2p2qmygu1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nl0aIaxolbZP+UIwNRPUyCBIbrWkNM9bnlNMBBqPedyFFbG7jjI/hv5C7jPzOanrWcYqiz7n0o3OCOc4dwWcYe43Z+8lkQQwyRYtTd2ULJdSXa067LtnmCVQDSt+m1q05Vh8LOihPsEbxsgLMbAE4Ein2izSff5bRolp9ctnrwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAwTDv4Q; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAwTDv4Q"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b57bf560703so3569936a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Sep 2025 08:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759159618; x=1759764418; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QUFfHCZ9kPQnI/DGEJ/PgzLIjVfpKbTJMrrLjEY+ghE=;
        b=kAwTDv4QVZddVayfRs0hOX9ii3BE62T5c6iKDd/yjTVrTSso3+vxnufv0sEJGNGwy1
         fKD5Y81QAsvCcsnKnkBXeJ+cyUUJ+kqCNzeXk+w03stzFmPXtQwgrnUhMBzw1UWPb4D/
         +kCdPdlAXd3mKJMp+4RfA4SYP/BrPnhr04n/DJfQYzQuwDG6a3u+J9nYGB7NutrE3x0V
         Bn7+2ndMRkhDRm+BmtI5C7UyRJ1xttyLSvKuokUQ8jV9FCpVWW4lPPgmLWAc8ikYPib5
         p6fidflqWjhGfDNVZVIY05mD0LSorW5EFF4h+f5FtQXsOjtl2HQng1MphknHKeSIQlVu
         EI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759159618; x=1759764418;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUFfHCZ9kPQnI/DGEJ/PgzLIjVfpKbTJMrrLjEY+ghE=;
        b=Y2BNmK9WlWDyDfLQF7cvuXxUic1RAk8ySl3udyI0+VV+CCkTj6U2pp7qBovh+m7ura
         1XyVCEbGaZUnUyoU2eQVTH5MbEU5IbV+ISQ0bEhD+I5Q2klDG0+tuauSdygEtuxh3Fad
         JDbtIiOkCP8Q5oVYvMqrFsExGYHlLwv/pE9O7mrjxrEW7GedCGSkTbI1EKFcw4RzNEug
         iLL5017Qim5wrVwVYxlD9YSI8A+c7WAfqrmhD+4Bi2uMIdlPfrOJSyUx5bS0hMXJPsnF
         CWkz93Rcr76K8o1/1X+RqagruWkV2jq/g2fXjlsJ6HLMULQrhPSAdS4gV57XOMfhyd+X
         Qk6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUirXpR6gffemwHG8tDUYhRUAh4NkT/PJhZWu8O9bQqaUb8TCpHDjzv5RninMgUnM3Y6tcqBEmNttdrxGUIWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjgU6nWnOD5KwniRiRsz/dWpqLLhTzoDSOS5vJ406fsgwFxEYb
	9XStCMaPGhUAuh0X+dUe3YTlMWJiXC97Vb12Yng2OqEW3d8t2jrsVKNx
X-Gm-Gg: ASbGncvcIPDbZZhBFHYUXVxfpd9aX5QED0Bd1bVdncDij0Uavoaw2XkMjKoom6ns99b
	SkYyu5LSQ67dhg6vDgqdDCcs6Pvp6Zt5igOJPZVxRmyNTXvggHnm9idYG/q2D0tAx8WBhakTzYN
	QMNSthByRE1ZvpbJBQ2M7THARZTMHPOET9wDHmSaVJYgPovGieluhRSw3tBY/l+jJuzUCO0IHyt
	b9P7qtWgIrlH5NRZAD8YrvqtfFl1r80oDqhm6RnRSnirIn+js4fTI9tAQ5CVee/nY2/fJWJSYF8
	z2jfD7m9GQP33AR8TcE0F7SQvMQN1cyTTjpl1jvTBiBt/pc5z65uZCPGKb3W0wh+zu8xFdOtLqX
	hU05ent/YL/EFdb5fRw7zTX/U3PBljzqS/UzJ1TTku5c=
X-Google-Smtp-Source: AGHT+IGlrXcMqMEE95Bpk6Fvp2Z3JkSBS53/nlBPtQ4p3saTyAp/aYHA69EYxK3FJ+53fX34h/VJMw==
X-Received: by 2002:a17:902:f786:b0:240:3b9e:dd65 with SMTP id d9443c01a7336-27ed4aab57bmr188196505ad.38.1759159618299;
        Mon, 29 Sep 2025 08:26:58 -0700 (PDT)
Received: from localhost ([216.228.125.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d37casm134991565ad.8.2025.09.29.08.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 08:26:57 -0700 (PDT)
Date: Mon, 29 Sep 2025 11:26:55 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
	dakr@kernel.org, acourbot@nvidia.com,
	Alistair Popple <apopple@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	nouveau@lists.freedesktop.org
Subject: Re: [PATCH v4 6/6] rust: bitfield: Use 'as' operator for setter type
 conversion
Message-ID: <aNqlPzZn9jUjSKfE@yury>
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-7-joelagnelf@nvidia.com>
 <CANiq72k3kE-6KPkKwiDLgfkGHCQj4a2K7h9c4T13WMa5b4BAnQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72k3kE-6KPkKwiDLgfkGHCQj4a2K7h9c4T13WMa5b4BAnQ@mail.gmail.com>

On Mon, Sep 29, 2025 at 03:59:32PM +0200, Miguel Ojeda wrote:
> On Sat, Sep 20, 2025 at 8:23 PM Joel Fernandes <joelagnelf@nvidia.com> wrote:
> >
> > The bitfield macro's setter currently uses the From trait for type
> > conversion, which is overly restrictive and prevents use cases such as
> > narrowing conversions (e.g., u32 storage size to u8 field size) which
> > aren't supported by From.
> 
> Being restrictive is a good thing -- it would be nice to know more
> context about this change, like Alexandre points out.
> 
> In particular, the line:
> 
>     .set_nibble(0x12345678_u32)    // truncated to 0x8
> 
> sounds fairly alarming, and not what we usually want. Why cannot the
> caller cast on their side, if they really want that?

It was my suggestion to relax the type requirement. The reasoning is
as follows.

Consider a bitfield bf with bits 5:3 described as field1. The storage
for bf is u8, but the type is u32. This is OK, because storage and
representation are simply different matters. And no matter how you
declare the field inside the bitfield, you can't prevent overflow
followed by silent truncation by just syntax measures.

I suggested to relax the requirement that field representation must
match (not exceed in fact) storage type, and instead bring explicit
check in the setter. With the check, if user tries to overflow the
field, we either throw a warning, or panic if hardening is enabled,
or do nothing in performance-critical builds.

As far as I can say, Joel scheduled this in v5.

Thanks,
Yury
