Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEDA325737
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 16:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767113952; cv=none; b=Ud4tsCxXZX+9q/00xik3LyqaxHYt1qMhbXWmfJ7/Oz0o0GU1mr+rGHnYVTkZu3iJcikc0Tt+GlOPRoxWHghMfH9O989YmuPmFjnrPyPAiHWh53FsBoVnngs2YsSA6PwJ2SeF4CAJ9J2YXviY3QQG92kGEWXVtpMYnQLc2moGmqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767113952; c=relaxed/simple;
	bh=dDbdKs/reOX/Ro2QQ4y9yDKHfgrv3HPQ+5tuYEjKOfs=;
	h=From:Message-ID:Date:MIME-Version:To:Cc:References:Subject:
	 In-Reply-To:Content-Type; b=t/6mjBxd3vjf8YXg9jwDhO5pdticuicotNyDTQfc1uemaHSk5n3pebbfqHGKgAukQpw+/g54rzUljfimFzGYOxV2HfW8bzXZNpjuUZsHS0BGvoRf3771R0GyDtldJnEtIPv5pjFKR5tqYvw6DKhRrYpa6BQbMnsIHQ+aNsH6tMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mObP838C; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mObP838C"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6466d8fd383so7689739d50.2
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 08:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767113949; x=1767718749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DRDjCthMH/qjCzj5SkNL4SRuuhJchcrlyUpx/5Dmle8=;
        b=mObP838COeOIAJUbmTPK9sw7/T4Ndssv8TsfvBW4HYyw6+dYL9Lu0pLsRfHWXC51jQ
         BTpL+u4VgJHhT+mc6lECd/G1WtTV0WCh92LaK8TOPE+3CH2yOQUp/G8uTEL5GWRudQjA
         ffKFje0GDhn1ua3bnmrdGnIsjrbJ3bzEqX/kC9rbCDdvaEp2r/bUd0zdoz3WVlU8lng7
         fkBvfBc/oBD7k4pvWcrl4wVZy3ZTSWFnjn4WxyCl15ndYZwskbonriRNmzI+YjZR2BYh
         GRyjo+R28f+cmVqEFgi2+mERaMEWPX9WzfrBvU7hC7eExtMWKi+3Fx3fyB22MnHGU3nc
         LCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767113949; x=1767718749;
        h=content-transfer-encoding:in-reply-to:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRDjCthMH/qjCzj5SkNL4SRuuhJchcrlyUpx/5Dmle8=;
        b=XpWMLBr6sX/eYPVtZxMS62g4Vktb0BNB53clpa8sZbUVrKCUcG1DFRRfUeQTHigj+h
         WeDWDYpqUP5xACkx+9c/ggl4D4yrAT5ApcuIvwtknN5CTXM8pguq1PGv3HAu4FCsUljD
         Wkzm5su0UW7f5mlF5M14aUebc14SW0PUMjMlstNzwW/6FeLAygMCRicXiZPxOBwkze0f
         YyGUmqHd8+kLCLKYQishYOiS/MWJNb9Pjm36OlA8bctz7gi8DVjV1CkjAHuu/5loA8O1
         dSPhMHFUJCLC/wzxnhs43Sm/CabOHibQi0iubRiVFAdP49nObGq/JEghVtHgodLP+isH
         XRoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQkdNJfyoUFn9FwLEYsP2zusYm5DkH1WHbwy9iP4iXF4UM+mxCyNJND1Z0AgV3inHU5NEUtl0q2Hbj0nJTCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJOeTq+WiGMW7mBxofpbIX3egiQEZ/xa4eWOjco9N3Uvhu5J9K
	0RB6B6CCO0CgT6IdLfo7SUb5saYY6nqCNPkMYWwu7QKKGccsik5+LeXR
X-Gm-Gg: AY/fxX7pq7vyuwxQVMZAB/Y9A8Nxvi3NiiVbadXBMpNMzjobQnmCb1lsme3nbZs+VL4
	3xGR65h/h9KkZ1ypjkXIVf7rWI0x6VzwCd2k6esVz5H5wp8VGx3UuLbr4QK7XUmyrITjUzPmFmB
	kfA+V4YQTWEYaf8E02X/ZwMFK2fK9hQMej4J2yg/DI56qgiEH1CGmf1YGbmS19Ii/4U2DjT7S3m
	Er7ge46wQnCAFdCOIjeZEl2t9chC4MCO61S9rvnZ0nuyrMMazp7W1+lu9tl3BgtOCkOe7LxNXB8
	qhehiaVATWlAjUMVfkqDpk6DvDZ6I9zz7vZ5u886cVSxAoJSQov2LPP3Oybm1i/PjFR8FNZXAC0
	2cGsXAak+m4k0mByBoaYCZV7Mtk/iFw1mDVexXODc935g6oWvnL2WgCHWiiCXfioBfnAbMIZAEm
	k1t+pV+kXaxO2G6pJiRKQ0dbDhny9ez1jidJY8Vnn6
X-Google-Smtp-Source: AGHT+IH2V57ZyrIGYmhMfY0baEpBO+dBiOAau3e5WvXJCMGvc5QlBIWU/5RRYx65BeBxQ6CEQap2dA==
X-Received: by 2002:a05:690e:12c9:b0:636:149a:f54e with SMTP id 956f58d0204a3-6466a8a5c84mr29092072d50.37.1767113948961;
        Tue, 30 Dec 2025 08:59:08 -0800 (PST)
Received: from [192.168.1.209] (74.211.98.217.16clouds.com. [74.211.98.217])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6466a92d913sm16230434d50.20.2025.12.30.08.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 08:59:08 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <f462b3e9-0650-4d5f-ad60-96e8f1e39419@gmail.com>
Date: Wed, 31 Dec 2025 00:58:59 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: xinrui.riscv@isrc.iscas.ac.cn
Cc: a.hindborg@kernel.org, alex@ghiti.fr, aliceryhl@google.com,
 aou@eecs.berkeley.edu, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 conor@kernel.org, corbet@lwn.net, dakr@kernel.org, gary@garyguo.net,
 jeffbai@aosc.io, jmontleo@redhat.com, justinstitt@google.com,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev, lossin@kernel.org, morbo@google.com,
 nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nsc@kernel.org,
 ojeda@kernel.org, palmer@dabbelt.com, pjw@kernel.org, rabenda.cn@gmail.com,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu, wangruikang@iscas.ac.cn
References: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
Subject: Re: [PATCH v6 0/4] RISC-V: re-enable gcc + rust builds
Content-Language: en-US
In-Reply-To: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I am replying using my previous personal email address to cross-verify 
that <xinrui.riscv@isrc.iscas.ac.cn> is indeed my own.
