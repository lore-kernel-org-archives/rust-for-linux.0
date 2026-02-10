Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01151329E47
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 13:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770730699; cv=none; b=YUUibM3wPNHQ3JONSz1wWWBKBZO3ceX14YT6jzJYCmgZCbQuxnOHvIXUH0seTZnTNLyvM5Mcthf2GdsJYp2wnOaJ5sC7/Xpku8lvot+R40TIikpy8PHTUmF+dNZy6fpyE2zyZqLuUaEvJqH9SRNqoTlYSft2lhQ7u1IaqKfhTrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770730699; c=relaxed/simple;
	bh=eSiyajRfADetRtl07XOsNLJn5q9P8Wq2Xej9cMuod44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJydmAmA2T/gpmwmcNA/33cXZahSlT4f3UKze6IFVEc2teQTjhe8I4uwhAUWT75JVYpxDrOnkhN5M+sMw3BDga0DzSA2hVeFdHXRVoF393W8qyE8ub3kx50TYnDcsnWHYiFKy/xdQ+CTAX0efWP17k+ZOfi3c8BmMyxs9woAVIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGk9rpeD; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGk9rpeD"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c633984fbeeso2436982a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 05:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770730697; x=1771335497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CplpPqZDHlPGdF2ef9i2q426qAgQJ2NUjvLt++VdFbc=;
        b=gGk9rpeDcvrR/gxsoJg21rTkJqIgATtZHoWb/zV646nJr7EKQ7UxZyTWOWaEOpIr7u
         F9gKjtktryh8AmTD5nKqnIWBel5MlVcE1x1p+WIOeJQWgHoHBh8H8p5mE9tK9YN3VNiS
         rBXwTm+Pd4nHE2lYe4ROw/LkFjFH1/Opx2drRDHEGLbxi9dPH5fk/MhQ6Gc2m5TfK4qe
         CNwZb7n/rkkpkq8YG/OX2MVCVfYuSCajqZRxmYohVObLs8twEZSxXrgzCXuANzkQc25n
         3qxhLwL+pPKFAJCH3dmAH2k/RwlW5Bq1JQYUy7Ty7yRt4S64fjxwOREW9IT8l7Z5ZD9h
         MghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770730697; x=1771335497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CplpPqZDHlPGdF2ef9i2q426qAgQJ2NUjvLt++VdFbc=;
        b=hLgpaQfnpIirbGATuxwpx9DzPYucNE27egSAoTzIX/oyL4TQCKTZkPRo88sfMqJrQP
         M5TFMiYtXS0Nm/T56T0J3/r0Cgq1Tq4wfE/D83d0tvZCZFdT7Io0+wfPzDL8GlN1CMRF
         I2SmBaOo1A9P9rQdLP01+SqV7fDr+Ug0+YkoyijEpJSgdN7nyQd1qlB5eKbJCNBMST0d
         hkcHGv+lXBAqUgEvJhw5UXh69i94hTs3DaP4MdraZJI5QiLBlP/sHLtHdgCPRrclnA8U
         W8st4Esragrmu7oa0MSqVXLO7eCcfu9254w/EPShAd8H/ysoZR6OSnhvI1BX43dysNgC
         1Hsw==
X-Gm-Message-State: AOJu0Yz8V68KqvicbYsW1WAu/vndbwJoNc5nRMs+JWl5v2ok2NuK2ZJi
	RCruTUtVLcAgpkVHnwMKXliCQN4cyTkoP3VM3+yzv1U2gcFhLppdKz4S
X-Gm-Gg: AZuq6aJHxgopyjcTv/Pbr3oIpkmHvWDdOjP6P+w1fnIIg0PKX/01uXodrj6+Nv+uEBP
	3ByirYvwHj5DaRXM6JrBRZ6IOW+vwaaj9bHEexfz2hDj9B2qn+a+ea1OzIX1Bk1s0ngf+TH0cRs
	CoKczCQR5gKK+ZFYm4CG4xgg8BoZh6Dufg9buzqgaKTeg/fmwM+2NJ2nEr602WF4SZNBIU3umL5
	68A2ZYVC6UO78azJCteVGf6Z/KoAozD4RmeDHMw17qT8XvQKemNp9F7D5wUJGFM95J+BCZ/jnlU
	YMdPCb+zsrqfxqJJTbFalj2jJsOAWoieVulZsnXK1mQY8soJtlYKL5HWtSNXSGmDvUs66S/khnb
	sVI1MlQdCRuQuJIhLSXhxspELAST8sxJ/ubxV6pXTdEGx68jdNgL7VOIltKxjkrK6luUbIzdwUn
	sSU+OLI/Xtjeh3IS8/Ln/Hkc51RcQ+JLLN1J2W7piVvVs=
X-Received: by 2002:a17:902:e5c2:b0:2aa:d6a1:e183 with SMTP id d9443c01a7336-2ab1005a8aamr22783735ad.1.1770730697195;
        Tue, 10 Feb 2026 05:38:17 -0800 (PST)
Received: from [192.168.116.129] ([49.205.43.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aad3c91fd1sm138660585ad.16.2026.02.10.05.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 05:38:16 -0800 (PST)
Message-ID: <0d336a3f-f317-4a70-942a-d87a3faa3a89@gmail.com>
Date: Tue, 10 Feb 2026 19:08:09 +0530
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] rust: alloc: add Vec shrinking methods
To: Danilo Krummrich <dakr@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260207-binder-shrink-vec-v3-v3-0-8ff388563427@cock.li>
Content-Language: en-US
From: Shivam Kalra <shivamkalra98@gmail.com>
In-Reply-To: <20260207-binder-shrink-vec-v3-v3-0-8ff388563427@cock.li>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This is a follow-up to my v3 series:
https://lore.kernel.org/rust-for-linux/20260207-binder-shrink-vec-v3-v3-0-8ff388563427@cock.li/

Hi all,

Thanks for the feedback on v3. Before I respin, I want to confirm
the direction for v4 to avoid unnecessary iterations.

Proposed changes for v4:

1. Drop the Shrinkable trait entirely. Make shrink_to() a normal
   method on Vec<T, A> that calls A::realloc(). (Danilo)

2. Add a temporary ShrinkQuirk trait to handle the vmalloc workaround
   (page-boundary check + manual alloc+copy+free) until vrealloc
   gains in-place shrinking support. (Danilo)

3. In the binder patch, use a less aggressive shrink strategy to
   avoid shrink-then-regrow oscillation: (Alice)
     if len < cap / 4 {
         shrink_to(cap / 2);
     }

4. Fix commit prefix to rust_binder: instead of rust: binder:. (Alice)

Also noting that starting from v4, I will be sending patches from
a new email address: shivamkalra98@gmail.com

Does this look right? Any other concerns before I send v4?

Thanks,
Shivam

Note: I previously sent patches as shivamklr@cock.li. That account
has run out of quota, so I'm continuing from shivamkalra98@gmail.com
going forward. All future patches (v4+) will come from this address.
