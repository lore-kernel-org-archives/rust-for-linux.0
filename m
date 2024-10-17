Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B851DF267
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Oct 2024 14:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729174208; cv=none; b=QH+77aOGoYZJHu7UmP60q6+B/x9x27o9on3C1RZbjFgve6P5RZgYNsH5vJvzDUv8UmWkjgAtp7VtP/njn/YJsY8KCg68tC/gMIlw1BS2OyTgyBAsHaunW1qglY5/Cxd5QTXaYKRVm9Q3RhFYG1wCQfmxVeW/pGkQ1R4FrZgrEIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729174208; c=relaxed/simple;
	bh=ImKjS1mAlM/QGNcooKsvSkdmdgnP6JCFSjvMcq5jt2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sGJCFLHUHSqJa7NnoF6aVugGW5ZaOsXilx5y0VMYv+eowGYwTI74Ne2d4aGJnXVRy3f4PYAlLbVtcMWoBY3XvmZVLV0jdfBpynnmdx4+NR5ZbvG1qOTxlWqIofdSJyJYHD/q/kkU7UqZnlG4eAlxGKhLESeMFiVy3+Clg5RNx1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bZVI0BD0; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bZVI0BD0"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539e59dadebso1516847e87.0
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Oct 2024 07:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729174201; x=1729779001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ffWX4sOiGU0Gsj52d9Xu9O70WErhSlef0BU/L7bSCGY=;
        b=bZVI0BD04kEtK/l/7PQ3x1QdrXMwALUErZEw7IrgpfTZQZl9YoM6LTlsEoGz93ynlq
         c9mzxhucKmRLdXectCeptS5Jkwkr9gdfGWVzAyukSkl0WAGIRWwJyYC8ymyFcez4nBqH
         djVKSuEJI2oXLU1GGbXNkVAc4Ud5C4TIY60gBkAggx/Bc1WihSkBGwG9EN4jOL83DfXo
         +NVF3Pd/ZvmzEMrhaP6HALHOQdiTkDk8q87/+7i0dtUhhaMyOsPEgNVKX0fIbnhmOg5G
         eQilvHjSFRUFgyFLE5Y+wSTaKHhiVuwchyHkjHYBmw4Q/lH1n6Z3jpams3T5zl/1yZid
         UEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729174201; x=1729779001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ffWX4sOiGU0Gsj52d9Xu9O70WErhSlef0BU/L7bSCGY=;
        b=GNhI1lfwGQaBU+mgmZXbfyPZHPT8WzwapK6IJkuevQiaQsKWezLG43mT46i8AuA6nB
         QIQ4Ry0+kDvkmEDmaHVgHbwxZzFKSBkrR6jdUeZcvPYZX3VrRIbciJa5f675W0Zufg8l
         BT0asW/CRBnFx+PB6o/lY3AhhNdf0g6Prnk0Po4+htnGjCxHA1eThZPwoCZ1FJ7ttVQb
         Nkip1XNCnthTzWboy1Cgzb5h/VAKRDZXMHNTMYBHVoXsvUudCD4tF2/FiJfHGq30zHRB
         trGIOTrtr5KCjlPlFJtyf026lDRxMnhQiLkbCTrfXG9qua/vKzJ7IGspciPaE+m5nNLX
         LwvA==
X-Forwarded-Encrypted: i=1; AJvYcCVbotEr5oj2c8Ux8zS950O2BWrA83/0ooqWjcga+ZvjcI1p5ibUn7DIQdqPrjzpI/y1druefW4Be5mnS4FVTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqxtE/nuEcyHbkv+PaexC7OorTeQ+1L1r4CjfbCek2r5uXb0S1
	gflLD8jRzLfqHEBe4/bEzdOLVNU2O922dCCeiQVtDm6xUtPy2DlKOsfGgY+KVVQ=
X-Google-Smtp-Source: AGHT+IHtZ6iuGFS0h/96h+eqk0OJejp1EEqmyNTB75Id/1Au+oEGx2EvNsYPOJigxq2qwKknsnsYqA==
X-Received: by 2002:a05:6512:3b1e:b0:539:eb2f:a026 with SMTP id 2adb3069b0e04-53a03f36264mr5616478e87.33.1729174201351;
        Thu, 17 Oct 2024 07:10:01 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29895da9sm301265766b.214.2024.10.17.07.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 07:10:01 -0700 (PDT)
Message-ID: <cb0eb97c-bb47-4465-af4f-3b5dfcf41681@suse.com>
Date: Thu, 17 Oct 2024 16:09:59 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/19] gendwarfksyms: Add die_map debugging
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>,
 Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20241008183823.36676-21-samitolvanen@google.com>
 <20241008183823.36676-32-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241008183823.36676-32-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/24 20:38, Sami Tolvanen wrote:
> Debugging the DWARF processing can be somewhat challenging, so add
> more detailed debugging output for die_map operations. Add the
> --dump-die-map flag, which adds color coded tags to the output for
> die_map changes.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Acked-by: Neal Gompa <neal@gompa.dev>

Looks ok to me, feel free to use:

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr
