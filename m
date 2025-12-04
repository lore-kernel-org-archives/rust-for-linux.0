Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07DD2586E8
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 21:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764882431; cv=none; b=vCL0TlHXQQ1+hBDUYP7mvLIr4CqNRBtX/u/8D1CLiv+hXvT2GMWg66Z5MgTWhgrgc0X5TMzUbN++YakVDRU2f9veHhZnNQGPGGPPUY8vNnia0mw1kp/1/RqPBIrTsRKOanW04aky3/NxiVoAXvTqE/JbZ3LIB/XE3UwjoViNMmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764882431; c=relaxed/simple;
	bh=XANNa0+fW6Yxkb3bup36rIJ7gJR914Afp07IHPoAPSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1ViM1bvEBTKNFIdtv6o97zgpAFXEuC/GlmLV0RR3+eLsguywKaLspvFlbu4btLsjSI7Q1PP12ycyOEdof/vNF/+TEUu2Eg925JTf0F4a0OoTQxXSnLFZQw75e6LNu+Q1NsVNySPP8HyhXRt98PBDEa8nPEshluoVQk4AG3HvAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEy2lQbT; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEy2lQbT"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7c6e815310aso992800a34.0
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Dec 2025 13:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764882426; x=1765487226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ObKFiKGAyLeMY7FeWXEgr99pvhYgBonkdMqLPE6SxiE=;
        b=SEy2lQbTK2UK80UQxfVSE27t5MOAlynpsr+ShgQ1QPG7wrHq9LQGEyIdO/8SVJ3hT8
         lQs8FKaZnEEaNspXabBbCYhpuChvZMRp/Z5qvUlUlm6i1r+fZ5qlYa7LDs/VNYl3I07N
         cG6yiTgOOshXV5fzZM0phxnYGOSe1u5JBcuHOdu7ivR8tllIa6jYxU8ULKwHVIlKfSBr
         Ae6RM8KCtc6hK5WH7eh0owEXy3FEf+qhdUcbg9YTYxTTgx0CxCffrZiC1l0mO2bH510n
         MQk1Awc95uPbjF+bYo7EKm6SeNUNK+o6RZibUhxwSVymQM2XOEgxej67dg/BXndbIzFP
         RVCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764882426; x=1765487226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObKFiKGAyLeMY7FeWXEgr99pvhYgBonkdMqLPE6SxiE=;
        b=HJMbpgKb0jXfvG0IGVIJQbs4McjtVSOMz7TEM8/KUg1ejw8P+/zioSBU3Ja+Qbyelw
         DDPlzQILp4j+LcI+Uk1GfbKCaOkPHAkxojLPfz5IDGktlkNkhXaaAKQ8xZgrSubM2d4h
         NIG8Dzel9/xjRvLuukVRYqc89CQubmqVs4b/jhlUsmmBZenplHbgvUrrqiZUTwWO1nKp
         C+7FSZ15iBF2k+a1YLVztFtIqWycR/+wj3DzDsnXvLpTbnMF65s1YpZOGrKADcg9QNqy
         X2PVlTprpzIOTbvj+Rtu2rsve/QFwabWm/stiq8ocgeZZ11dghnIka83yJhBukOheD6v
         Jn+A==
X-Forwarded-Encrypted: i=1; AJvYcCWk0mRY8TADp8ay9v7zVn+Ik6mec5rEMUSm6/Oofe1SSypMlj8oA8Lv9FsgaeKLXQGzr5pE1QB12vGI0GMc+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWH6ycTl3RXp6vHtpFzsICH0jsgLI/t9Bm+LlNaUa1zOS5mTRY
	751vXRS+gQe+eHCoERc0dwxP64ZVq+2gckiif4csdnf2r56XNrHmXnoDWXhExA==
X-Gm-Gg: ASbGncts2KKeGBK00OR2VURuSwcKckeZQJ21ejjfBNWPYc58L1ykG12JEHDnpyPu1Tf
	gZAIDmwkTdRCwu1c1C2exBgthKhsRYsf74WXHFR7aNAH5lPtXaf2D3GtF8vH8oF9NOOhYHsY9eW
	dqk3R+UbYPZjg4waFTrrwjTIRV9nnDx/h+HOu+hOkLToIDta4IOiv6oprsquAPsCwZ0RHdLSV7F
	RiuoJROejxQdsW6RvUDpQmQNR7kBm3G+jBVGdIEPFFfBlihRgGB551y0qMjmcw/MQCt5onge2vd
	mTrP3/faGy5hR/UjpnAFb2N2dkMAPqWYXEucyAHuL5leDTjUinwiTau3xpQ5dQnKAqhzOVIFqUi
	k1dpNw4sL4iPeD5MIfAa5QW1onKLsBdDfm9PikxwDAH7XP9pyWruXEj7C/H6nHyA6Bh/kPE2UAu
	KI2xRtHIAIUvypj5z2LDKqG5xeq5VnkXyoROf9X4wXJAvjOPqylNKyPf/17EfnZblP
X-Google-Smtp-Source: AGHT+IFTX3Kk74h8stCW4HxZx6IIYHLV1Qpqejw7b6IEFFd7sdO8FN8wywBMKHB8xrUETeni0+4gtA==
X-Received: by 2002:a05:6830:6ecb:b0:7c7:2cdb:ff4b with SMTP id 46e09a7af769-7c94db62470mr5185115a34.20.1764882425955;
        Thu, 04 Dec 2025 13:07:05 -0800 (PST)
Received: from [192.168.86.36] (c-73-166-115-174.hsd1.tx.comcast.net. [73.166.115.174])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c95ac8418esm2173751a34.16.2025.12.04.13.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 13:07:05 -0800 (PST)
Message-ID: <be85b0fb-4bf0-4cb7-bba0-702c1682778c@gmail.com>
Date: Thu, 4 Dec 2025 15:07:01 -0600
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/46] rust: maple_tree: add __rust_helper to helpers
To: Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, maple-tree@lists.infradead.org,
 linux-mm@kvack.org
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
 <20251202-define-rust-helper-v1-23-a2e13cbc17a6@google.com>
Content-Language: en-US
From: Andrew Ballance <andrewjballance@gmail.com>
In-Reply-To: <20251202-define-rust-helper-v1-23-a2e13cbc17a6@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/2/25 1:37 PM, Alice Ryhl wrote:
> This is needed to inline these helpers into Rust code.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Andrew Ballance <andrewjballance@gmail.com>
> Cc: maple-tree@lists.infradead.org
> Cc: linux-mm@kvack.org
> ---
>   rust/helpers/maple_tree.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/helpers/maple_tree.c b/rust/helpers/maple_tree.c
> index 1dd9ac84a13feed53c0ed5eec6805517081d0673..5586486a76e0de60969af1510b4b0428392920e6 100644
> --- a/rust/helpers/maple_tree.c
> +++ b/rust/helpers/maple_tree.c
> @@ -2,7 +2,8 @@
>   
>   #include <linux/maple_tree.h>
>   
> -void rust_helper_mt_init_flags(struct maple_tree *mt, unsigned int flags)
> +__rust_helper void rust_helper_mt_init_flags(struct maple_tree *mt,
> +					     unsigned int flags)
>   {
>   	mt_init_flags(mt, flags);
>   }
> 

Acked-by: Andrew Ballance <andrewjballance@gmail.com>

