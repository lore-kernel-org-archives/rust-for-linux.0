Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE2D395251
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Mar 2026 18:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772994594; cv=none; b=Dq/oj5QCu/6v3aUCEID8P8ptil48HdgIR86cS7hQ6GAtyMnjelu9p8nUiNNdTvcCTCtyQm5Lv4YkjFoBek/Tyb9skpNftBwEU4uesz+Ml/nZtr2GWxPas1HN299o14KnzZpN1uXgeC7UKBeNKzhYmEGHbi2JGJqHpuPbrQbVb0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772994594; c=relaxed/simple;
	bh=arzKqSNGevaBW7ZdocNBXHLJxNKmMFdb7TG9ttHmyr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UVCku8JDnmHvdawR9pEDXf1zo+8KdHlKFvAHhlaRRLc6Kz4B2Wzb5tKLRVLjD+hntyd5UYGU+Pj+YPYm3Quppe1BXlc3VmFqY03ovW9VHcjNQWBKwWmYPc9sXS0ttHp8MRu3w4NJaPPBC/pNHZMtNt44+Wuq+LRmNN8HC3CupQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTJhJZu2; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTJhJZu2"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2be06c02f66so4313821eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Mar 2026 11:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772994593; x=1773599393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8HTB42B5AkCVJd+JbUlotXstzfyeA5ZRbWHS4OQQdLU=;
        b=cTJhJZu2fLxvVt9Algmc2klX+bEO2kusJhX3IyxubVGiqumT7RBHMBPxfGMAaiSZtj
         FnpPtOStV+I9+wZ/ouy27jzSWjRmMOUd59rNfnJQogKTlCI3f59rJGOAUFMX9fT323t0
         LqsjIoglvCeLaGxvelgqLT530WJropyZkjuiPD3ukENi/HbodVAdbuR8apfRD1S3HDOK
         iGvIR1oiZm0NAmqd0Pkxfrrsbw3XVO8fN7rDxIgNSUxSdew2oJvxwVfdQ5htSYYTNu71
         7Lc6wyWyOl+MVqgV7oesPGPEeI1/YhgsgEYfvleOpwRdTD6bq+0lkGxewawHFcuDMFTO
         4+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772994593; x=1773599393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8HTB42B5AkCVJd+JbUlotXstzfyeA5ZRbWHS4OQQdLU=;
        b=wcpl7MV9WRG3iy1uaucSuLjMztSoLDn/y2ChiCLN5BXxt6ptQJKxxS3/B2KPnVPpYl
         I8Y//4R1wUIbHIvCd/9+i7d/33Vqe23cZxcQRDDZUktlc/tWENFUaSdIRigIJrRBuuvM
         QeMn/e6iX4gAnZNbZVeXiU0iZw7yNrt6mDRBaX2ad1Ci4Y8jsNpCMzCrqDGBkzh2SMGy
         PXwoXd29Uk/+aHAejNhjwhta15pCEs5YH9r8YdYmzcRIUfhi/eNveVY+f5AF5tEkPtyL
         Ybn9s1liCpJ1WncM7i0EF2xMzmbjZXifcE+HSF73rRvvttg5xy0SlI50GniFUOe8hF1J
         odvA==
X-Forwarded-Encrypted: i=1; AJvYcCXg7emMXSszPo/ux9aY4ZdOyi5031XOsy3gdYz2q1VUSKXMsEkuMeChDaH9CBV0eqzygwH/mScUE5gBX1MR6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpUUI0vI+9ynr2eyman/lgzO9Vwl2UDlyiNKN7QghcF07syklB
	+dn4kzL1/wjLZebdEWkNtgRiRtwp3diU6pB29WBrsjyEQAVSJtdaODKvtcC6Sg==
X-Gm-Gg: ATEYQzzIwcD/Teg2+9sT+VMfORvKJQAezDpXARpTuPj/7bn0iwlpw9OjclmAaHlLilX
	0qWghRK46VNJk49YqdoKvXt+fJDmd6BMQFIxx6X1PbvVFFe4rE4IbVZOtoWvx0hJIi+fnTdTWSS
	YAUVlF8mDjDMfi1a5DmqYhZcZkR59zamIJAcipNXo5oQbeix6+YdHwGJtQY3Cqv3MgJHenOHgZr
	VY0w5GnEFYUT6aA8HV6KelordOzG/pj8D0z8kPuWizoLt80LKVoq2OACo7U0SE4T66YQwmMt1YD
	ZqZZR2/WiaungcP3TR0GZNH+dazHQPevyvkFI5ramFmg2xWNoWyix7/kj0c7G7MWTRJu35aQKuT
	wT4AhmRkg1Ry5wMtv78XDUWajuuSo18Vh60qYD/JduaElQTDs4zbxX/Tz3bl/eLSt7U9r8HqhUH
	XWpH9z2w3QRJmdmScYyxQAQODH6xQdu/TzDbtqRLTN
X-Received: by 2002:a05:693c:3104:b0:2b8:26b8:3444 with SMTP id 5a478bee46e88-2be4e065b0fmr3639035eec.19.1772994592727;
        Sun, 08 Mar 2026 11:29:52 -0700 (PDT)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f82850fsm7599999eec.9.2026.03.08.11.29.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 11:29:52 -0700 (PDT)
Message-ID: <f7e1ce48-cc0f-4365-bb6f-1af2635dffd2@gmail.com>
Date: Sun, 8 Mar 2026 11:29:44 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] docs: sp_SP: Add Rust documentation section
To: Edwin Toribio <edwin.toribio.j@gmail.com>
Cc: carlos.bilbao@kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>
References: <20260304200715.76360-1-edwin.toribio.j@gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20260304200715.76360-1-edwin.toribio.j@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Edwin,

On 3/4/26 12:07, Edwin Toribio wrote:
> This series provides the Spanish translation for the Rust documentation
> section in the Linux kernel, including the quick-start guide, general
> information, and coding guidelines.
>
> In this second version, all documents have been unified and updated to
> comply with the feedback provided regarding style and technical accuracy.
>
> Changes in v2:
> - Added new translations: coding-guidelines.rst and index.rst.
> - Standardized the use of "p. ej." abbreviation throughout all files.
> - Fixed the Hacking section truncation in quick-start.rst.
>
> Edwin Toribio (3):
>    docs: sp_SP: Add Spanish translation for Rust quick-start
>    docs: sp_SP: Add Spanish translation for Rust general information
>    docs: sp_SP: Add Spanish translation for Rust coding guidelines
>
>   .../sp_SP/rust/coding-guidelines.rst          | 543 ++++++++++++++++++
>   .../sp_SP/rust/general-information.rst        | 178 ++++++
>   .../translations/sp_SP/rust/index.rst         |  45 ++
>   .../translations/sp_SP/rust/quick-start.rst   | 384 +++++++++++++
>   4 files changed, 1150 insertions(+)
>   create mode 100644 Documentation/translations/sp_SP/rust/coding-guidelines.rst
>   create mode 100644 Documentation/translations/sp_SP/rust/general-information.rst
>   create mode 100644 Documentation/translations/sp_SP/rust/index.rst
>   create mode 100644 Documentation/translations/sp_SP/rust/quick-start.rst

Thanks, Edwin, this is much better! We're close, but not quite there yet.
We'll need a v3 for a couple of reasons.

Thanks,

Carlos

