Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8481F1534
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 09:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761471519; cv=none; b=aeQ1IfHtVNZQ+0e+H/oQ0yIwbZYfCxOxIDcKucirfWhauZTz+fQ39i1Gtp8OOIdSDj/OCi6wu+ferS2qhZxuz4ra1OBW2NM8afEi+IxANTRslskwxmcbsqqfdJQ5FkI8hJ30rdbFd51veJcT1wYcy8IJ0m6DEKseLZkDlqZyTic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761471519; c=relaxed/simple;
	bh=BlGELhvKOBCcUK01cT+hHszOs7SJMhq+zuaurlP3kzw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jBfiLLDTXHSTPgn3qVT0Ps5V92XYLIWokWkJ9kuNSYZCRqWL6/+HiH4WtTGKolILuJQ/ACO1vFm4+z3TJxQrGwwiTKp4QYO2D2bR2wOCZ14rA+eNr/74Dq0pma3gQH+nEQ+uq9RaBHzSxTPFopFtS8p5CidSfPWPvIcD0dPQooE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cj/eAAOF; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cj/eAAOF"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-427015003eeso3271499f8f.0
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 02:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761471516; x=1762076316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BlGELhvKOBCcUK01cT+hHszOs7SJMhq+zuaurlP3kzw=;
        b=cj/eAAOFm8UR+TjUspS0+9/+KI6GIZFDVK4Ls6unokE/vw9yZ+Ph94oKB+CC8Z3VEq
         Ctagx/7QCj9IAdc9Rz74pYeIUXNkSLKBiNA1HXUZIQmSmkVgpYhNqY0r0SocHYJPFh0F
         4foA9fP9ewmuc+4nSWY3EzDW0LuHSwyvrODj9zY7p152h6q8hP3ZCRbTYUHe4GK5VvfW
         goMHnztEdDJRPS+51nxe12jicRVKobl7i7qiLCetvaS3qjOj4BQFJfxQfle5LAxQMrOj
         lPlsIAtvv0MBF7V4AInkalLvKqQAMMOuaOvfKKTW0WFySEhVQhn1E40xIL0Q/sRbFCHA
         TMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761471516; x=1762076316;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BlGELhvKOBCcUK01cT+hHszOs7SJMhq+zuaurlP3kzw=;
        b=U8avthcTWacRpqM8YeFs/yb8wwIG/i17+li1SY3iAksH2gAyPM4CvUmN4YhmMO9DBq
         KmIjyXlWKDhG1R62X2H4KsHzcqKccqnognJYfdfdeHnnPMvxHj8EgLnOr6OCN0KsuFtO
         wMNg5SAfpv373qzOQQI2QumCu+3yjArLzA+7SeK3JJKnopFo0wt1LlblP3FSBKmIyFzQ
         IZTLPmeR/hhsTWBNNve0iZT/1LDkXId0tPlHEhijSp9Lz0tiwnpfYbDv0+akoob7/sj4
         nam8AfrjNmJllWH9aCONNaXuosaUe/9oInP3/pQ73pNltzOA7ibVW9hsnG5832XxUp0+
         327Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7l1Ves/eDzGrl+92DwD0SAC6ogM4vAgANLPo+cafhB8yfG7JrArzTkyBacCyziVeZDao3GErMoY7whpyabQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4rthVec7/7LM48b7fJMeHUtArQXP83HeB2jH4gBl2IPG/ZipJ
	tSRWwbQ18SalhzlU8/5J4JAD3E+feo+aaIdrjC/caDZBVGDXcBW/j6fl
X-Gm-Gg: ASbGncuEVaXi0fmGfDdwkcBQ/xLBIDmdCnXaqwKN6JbDN4zukqUXRQgZLZIEwMkYms9
	73uIfAqbZRlmCbu8wNzTmtUn414YI27EXNrciH0/tPk8FJHg4BrVsHXcjGvcl+4mSYhLTt0wtlV
	6VlknSCuVm0WkFvnqvJ1NYp79PjjDNvAWLgF3kcIgoE0jb9vcGG3OqABzUNhwnFdNVo9CYfsmw/
	/C6VqvjmaAiIXhaITvTP/U8Gz/dHzxEygKjbu5Jera5dfPqOGSwvvnHj7YIQbuKILdIczNZ+tdh
	I5uVcNUy09Obt8u704lS9GGvkAKVP2/h/De9DFFO7GoiywGTEQUIRFuibOU/v5K3X+xYdbipGRV
	WrnEF26+HY3ZE0f0ZECOJBn0x7wDw/MmYdWt1PRsCl7soZ3mdSCLmWd3d1DtAdWgT5KKU7VrNQ3
	CbPKTZui6Olk7Q5MamA4ixHXk46y6ONX/gI1VPtNn/+mCC620gkq+I7AaG/8022oda88DyWwgy
X-Google-Smtp-Source: AGHT+IEjnKK7Q47TzLdAeD/BIWXcqdHCINnF1PkJmHJElS4u7hTRXmg/V24ilZ9lRzYDGAOsD4o0tw==
X-Received: by 2002:a05:6000:41d5:b0:427:666:f9d6 with SMTP id ffacd0b85a97d-4270666fa57mr22885765f8f.39.1761471515642;
        Sun, 26 Oct 2025 02:38:35 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:8b21:7400:c9e:bafa:eeb1:89f7? ([2a02:c7c:8b21:7400:c9e:bafa:eeb1:89f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd374e21sm73364465e9.9.2025.10.26.02.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 02:38:35 -0700 (PDT)
Message-ID: <4d6d737e-6e9d-4d33-8402-940947170872@gmail.com>
Date: Sun, 26 Oct 2025 09:38:33 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] rust: i2c: Add basic I2C driver abstractions
From: Igor Korotin <igor.korotin.linux@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Hung <alex.hung@amd.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Xiangfei Ding <dingxiangfei2009@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20251005102226.41876-1-igor.korotin.linux@gmail.com>
Content-Language: en-US
In-Reply-To: <20251005102226.41876-1-igor.korotin.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

Gentle ping on this series:
[PATCH v6 0/3] rust: i2c: Add basic I2C driver abstractions (2025-10-05)

Just checking if there’s any feedback or if it’s still pending review.
Thanks!
