Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AB45661
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Nov 2024 02:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730686529; cv=none; b=snlRFH7PNXg/CxZWUTrPHjpvcJpxPo9d5hCu/A4x6eCw2CJbE26dNlX0kRbdBkwCJC7qIkNZfvs05ZLzQX/3yc6mS6157b4G0OliiVsxA0fRhKZzo69RXwGesZ/Barh9r+upw6tKuE4CYKxCH798gDD/hV83YYriO7zCWcYTrW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730686529; c=relaxed/simple;
	bh=fniGtoX1szhE2H06mw2KTcBB1zCuFSAIhEGm8mm4IxI=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=CwNGbvSdpApkTjU45Ynndch8RX7vKBiZGXueEHrLoW8EriWC2/iaMshKAPlutuqM4uAoqc6/A/CHUZweC4zcAORJnnj+mVR9XUctWx8ZPDBAXTar0/r+0pRF2mh8yhde+d5OE2QvAxW2CXOplXBtgpva4E2V8HICyOoMZuz3cXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVWbRRT3; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVWbRRT3"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71e70c32cd7so3375071b3a.1
        for <rust-for-linux@vger.kernel.org>; Sun, 03 Nov 2024 18:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730686527; x=1731291327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fniGtoX1szhE2H06mw2KTcBB1zCuFSAIhEGm8mm4IxI=;
        b=hVWbRRT3T012+pY6CMOA0090FFqZEcKAjDVyTIcT4qzbioF76Bqcb8gk4yrZ5ITX4T
         icFF2c2l5oE6RTg/afoEDSLGOz/7aFSLflORMHkJqnzICq5VDJBd0WJsBH2Di4h/q2kY
         I9fy9d4VHgUuXPSOLMvlDzJZnpELrwPjnJFI/+b5svvN+JUeF+Zun3pPLXjfoLk8rYn5
         dWero+29pQ/j5oyhwRC8Ol+72JemBwrDN2DfEERm6IPmh0rBfTPOIjTWSCBH1HNcqUod
         56nJTn0cy704+6V4h14PurIVdm3D7NzjzYFiB44wVwyJe2z5p36TYwaNLSU7rrBRl/XQ
         W1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730686527; x=1731291327;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fniGtoX1szhE2H06mw2KTcBB1zCuFSAIhEGm8mm4IxI=;
        b=txlnSTGKUoFXvEF0jXhHxMNr546FOpJaleH3/Wlz021Wk823KBcZsjgjNmlsniuqmj
         bUOybC6sQQJwI2o3EbJpAQ4SWeCW8HjUnRd5vz1wVpUMbhOoFze35fvlGk2i1rHC14yE
         4fazVZ/QDQPah9C+EXqOUagXTvrLPFSILr6U39sdPd9OI3iZIFcIu9KrSsARBV4J62DS
         N30Gq4kWRHqAfp91lHaYG6nu5IJ+JrP0jrFTk6rhR22fmCnQz7Cmnpj8vMrSFbst57+f
         ayY1SwjmXGU6GpF6H51RFmzrrP7PuQSYirwxDukFQhiNbZdHliZR+6jYg7IMEwnw364x
         8Zuw==
X-Forwarded-Encrypted: i=1; AJvYcCXLCf5CavRSPWHS/GLk98oGIFSLxR6FcVULZGkB3/RAqyzmZgAmrEFqJJ6TMv1gB672o1U4xKx67h8hrpP9zg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv0110Y/WUTyyTSIr+5tjUusloUQSoR/0ytWMYVE0od/VE2ZIU
	ksdXpD/FE4nLiFVPy32iG4GznTx7Utym4lhLxUTrC63CQc0yG5PX
X-Google-Smtp-Source: AGHT+IEeKb/zdoJirLKsMFxRHSvhYB+2rsQ71TlM14GbFsN+5ybWDCtCPDYY/up2JSwEZp5jTP9Hpw==
X-Received: by 2002:a05:6a00:2ea5:b0:71e:5a1d:ecdc with SMTP id d2e1a72fcca58-7206306e031mr42610283b3a.17.1730686527089;
        Sun, 03 Nov 2024 18:15:27 -0800 (PST)
Received: from localhost (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c47fcsm6300744b3a.126.2024.11.03.18.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 18:15:26 -0800 (PST)
Date: Mon, 04 Nov 2024 11:15:12 +0900 (JST)
Message-Id: <20241104.111512.1370021952355538395.fujita.tomonori@gmail.com>
To: jens.korinth@tuta.io
Cc: miguel.ojeda.sandonis@gmail.com, fujita.tomonori@gmail.com,
 rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu
Subject: Re: [PATCH v1] rust: Add pr_*_once macros
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <OAo8RFp--B-9@tuta.io>
References: <20241103030530.76756-1-fujita.tomonori@gmail.com>
	<CANiq72n3bdNoYsSo47BGK2AJX_yhREoOxfKwkMBwz4v3bR-UHQ@mail.gmail.com>
	<OAo8RFp--B-9@tuta.io>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Sun, 3 Nov 2024 23:29:29 +0100 (CET)
jens.korinth@tuta.io wrote:

>> Hmm... Isn't this derived from what Jens was working on in Zulip? (Cc'd)
>>
> Looks very similar. But more importantly it's missing the hotpath
> improvement suggested by Boqun Feng, which improves the perfomance
> significantly:

I think that it's better to start with the very basic code and then
optimize it with commit log that includes benchmark results.
