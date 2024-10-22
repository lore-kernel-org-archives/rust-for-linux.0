Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF5F19B5B4
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Oct 2024 11:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729597371; cv=none; b=nu/oxdkiajsn4OYGDApZLv7cCzzPbfrAf99JQjRn++mRNrFN3nIkwa1pwoYNuIRss72etIX0qAXpW1WnMcylK6UitC57xpF/a7gKo/OeRRFU3b1D+IuEZrc9w4AEBGnUGxxdlE+mweKTlXO8i3JPWJN53YCxs7Yn7W0J7LKeSHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729597371; c=relaxed/simple;
	bh=raa66sydrVS7SYiJ0GgKYuUMIZ/xbMw6qo8atNjsO8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZObv3DWwWMRspBWmBpiyIHe0DDxiP4ulED3HJqND71hzTFak6riKBA2Q8S53msuDQUFlpPqr0VbZqrp/xlcvLOnXzZ9p5/txPwKF0YjUkEi0liLglX3AIdRGth3LF8zY6YwgZ0MsEGqdeb+v6DqMW0cZPpV57CF/XIebHupGlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cffjGT7C; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cffjGT7C"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a99c0beaaa2so912871866b.1
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Oct 2024 04:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729597367; x=1730202167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8b6GJXioy/QHHMfPsIPiSHRGT4MhlfXPQwWNMxqLwkI=;
        b=cffjGT7C3sFd5RxxcIaS31FqZeB7ognz3qpOyWbztqtehNtX9QrPX1yTHr6dh6SLiW
         9qFK6w3Za90hoBxMl0TojlyY937xy1JHH7w/FfR5Vr0nDF02og7PdR8yWXUh4JkXoV8L
         bweBrzUqvudH3Q0rTUm+RIhZyTQb9yN97MH7sz0Z6KM/JtRvsjEamz0UpDwWrX5ccuE1
         PY8YZVNU/bc5vEzOqYgAsSovUOTrX88uWcYwwT5cLVHZiXZEQZvOegCNt4wfqgBMkLFB
         whYr4T0fIEK5u16e6Zt45W46FoR+lwJPwwUlBn+J0Jt1iGC6uDVeJsyLdGvpozp8/ZuO
         rt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729597367; x=1730202167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8b6GJXioy/QHHMfPsIPiSHRGT4MhlfXPQwWNMxqLwkI=;
        b=I+VaHa4l+/m+H6fPkBecQue3QjTap9mSGf7/OEeAVQf+pR6EApipxZQx4w7anQCib5
         zSECpaWDIrwOpJ54ucdpwuuQ06hGamKxexyfRXy4xw3tIjZt6dcEuWEnp/UUgjYi6tRM
         ptKw5VDYR1XvPi5e2RYpYfW9lUgFzQTmxQBSo8ROChnE0LS1JcizxdZT84moV5xmncna
         RyI5tdTQoCeFVIKBi9T8Z9ERNAjPgcCT77K6YFmEwrX4VphqGYOBZFxzv26pWqGdsDCi
         rWsOGHBNlLM/hnJgbLXELC+dyNiy8qSlul8PwwiRcCPGhhBZALynlurHB5xQd4ZaprPF
         2VgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi+0b5DHGHTxo5ZiJYrem6In6yv7Tzo3L+URCAxqia9bBU6bEDHv0fRWhHnvb0At7qdWSKFc2HjYmrlb6LOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWbcvSfu6B9I6AR+MtBG2VlrnMP+vuzpAUHVaW3e5n8veiQEt7
	2Tsv2iYKhn5XS87ixmRNY58FuqCUtIti7YU+Ex8fIMmjPftstiDikd8tKepbrVs=
X-Google-Smtp-Source: AGHT+IG2HVAkARznKGeXSSOz3pYHmzdRrakg/LgoenOtPU5eMNDOO3eQvdGmwFfjp7NcnbHTBiLBcg==
X-Received: by 2002:a17:907:7d9e:b0:a99:f8e2:edec with SMTP id a640c23a62f3a-a9a69a7dc95mr1691628266b.21.1729597367082;
        Tue, 22 Oct 2024 04:42:47 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a9155a1c9sm328599966b.129.2024.10.22.04.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 04:42:46 -0700 (PDT)
Message-ID: <df619b5f-998a-4c6f-af80-b2923264d16c@suse.com>
Date: Tue, 22 Oct 2024 13:42:45 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/19] gendwarfksyms: Expand structure types
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
 <20241008183823.36676-30-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241008183823.36676-30-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/24 20:38, Sami Tolvanen wrote:
> Recursively expand DWARF structure types, i.e. structs, unions, and
> enums. Also include relevant DWARF attributes in type strings to
> encode structure layout, for example.
> 
> Example output with --dump-dies:
> 
>   subprogram (
>     formal_parameter structure_type &str {
>       member pointer_type {
>         base_type u8 byte_size(1) encoding(7)
>       } data_ptr data_member_location(0) ,
>       member base_type usize byte_size(8) encoding(7) length data_member_location(8)
>     } byte_size(16) alignment(8) msg
>   )
>   -> base_type void
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Acked-by: Neal Gompa <neal@gompa.dev>

Looks ok to me, feel free to add:

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr
