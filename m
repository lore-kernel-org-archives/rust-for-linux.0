Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3741C34F46E
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 10:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966876; cv=none; b=pAZNspQ5W+M7gR+KmPW+bOeX36OgmLPBe93CxjyihBkyK28mjUqEghBdyaVloYStG2ugU32eC9GohpudwFTyjZbSgl03O7pzHLEGtrTALzSVzzKtupD3HCRkdE6xQ5pvVWKBpfF+MpKbHtM/3pT1RugGGr+9Vq7FzMHjvx2iB50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966876; c=relaxed/simple;
	bh=cF083mu3r55SVNE++nE4r8UwPmfojIpwXzIP+N1PTgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B4A5PP3mmicewhuXr0P4MYigbQn2JQieG5LFqD0P328U1sfpo8q54e+IjPoX7y8brnFE9gjdr3OmyTeC3FBu9Ni6psUBqdBSbGb/EzLozgB59UrkfOfcH9l1mwqu5MYJ6GReRBWzz8VJqJBRR90Cp11E7N0oKI5SVy7nz6qMp6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtghsHur; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtghsHur"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29f30233d8aso56211525ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 02:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765966872; x=1766571672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nVo0HBOMwKu9ksJmzCZKQPSTIhrU1ZIPJ/ubRTYCNmk=;
        b=HtghsHurmguGNme8RNmqRFDG9RdNeuuVDxVeNoLOalL586crJb5um6qDYuKMcaaW4o
         X8q249UvK/k32ghuf7fhEg/F8lgJd5QuckhtknrxmmZxhsG/bRnmD9sycsz9PXx7cRV8
         pdKK9YhFufieic6b73cfzaFPfdHC0QMOqVPBxVESqeErIZTUW3Sgb2Riph38EEQ0j78E
         cIX3XmpBQ+9/DWK8i22CYjnsPcFRaxLUcwNhrqKI8cefPpk/V93iEdvOVLl56dXrS9mO
         7JqNgOaoVgIsZ2XpBWvFWyjUnltKcinHUNVY7QdJPuLRFNpVatLmVaaiKCvn58pESYJQ
         xYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765966872; x=1766571672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVo0HBOMwKu9ksJmzCZKQPSTIhrU1ZIPJ/ubRTYCNmk=;
        b=SO2VgSdCYFvQixVXYAq3/06/ra/kbij28DK8aYTNId5e6sMKAx+22XYv6rTfv9odMn
         /dvBXJRXI2/FxdnzmC1d+29s3AcOWMqB2Gknj3HWlsSC/MLTKQVrPy72G+z7iV0/z83C
         B4IofBnnNGRJRFsf6kP8WwqPs26kqIyTnZeIuuuXvsKEmDIOh7hpExtJyqhVzQTNApbb
         FSt0FjUu3X2sHfwYlwvcBQhLeHYt5nRXyj/M5pBXZxYcN9HfxM0p9gMEd8g96bWDAiKv
         eiwhKvdzMLTv7ueiLp8B6OWps5qE+axZsQnMSBiHoXW4M0BuublIcJpSDnzg/YVgIVmd
         dzwA==
X-Forwarded-Encrypted: i=1; AJvYcCX0dk0+PZnOfcR+3V5K5aVfsGRSYN2/0dmxk8UiEOolyE8plaBwI4bReQWBfNEV7/aPXp57cpK7GMhR597B/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv73doLvsh59sixgJFq2Hl8EATELizYRJWubjPJQdRXJkFnea7
	jTklNUDHlQlty+mhg6RJddHTut5o8RVEJhmzU5/1PAOo9du7gn2YiYRe
X-Gm-Gg: AY/fxX4kL3ngk57Q5bl556R79OgjeDZRENDSan2IRXWxjbernRTKLJrgTZlvS/UVhur
	5BBGQztMTn5Fq6OjVUQnt5PBZddMu+Lp5yMIKqHvOavX6HaHDpwYu+XSQzc79mr563i1uQtVI4L
	HaWSVGAEDACu7YHEKH8CQp0wkP5ehYY39go6LefXudIkm829WqxbFjwlpiHJ9Ochcq6mhTfmzeV
	ylxknm/BVpPXW4iyQfIrFQCwdCkyx8EnX/eMQdJofwygwzmXTo31ndy2Z6UMxnKMbEdYeiCOkhm
	NY0IGEIjSg5Qy6XdvUSS83I/EYjoajgP0AUgmOU5dh1Gtycj0C2CbxAeQzLFlW5v6oNt4gU0NlK
	GeVsbzB7sXPZilBWWaP2sEsiH3OElym0BGkyEOEvmQbhpa1kQ1DpvoVoYR2+Lq+LR4lprzzbetr
	xojOUGLYH/AJsWxRsGFMjBla/5R1GE6dOUdry/TbTuDOEFmfOMqrT+cx2mfer+ySTjYA==
X-Google-Smtp-Source: AGHT+IEKnlxl760/suZ89AobjUICKYa4N99bq8z5k3ImT4XOViJUc86UsaA7/A8wEeEcuyACIfLqtA==
X-Received: by 2002:a05:7022:158a:b0:119:e569:f276 with SMTP id a92af1059eb24-11f34c035a0mr13548110c88.31.1765966872169;
        Wed, 17 Dec 2025 02:21:12 -0800 (PST)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f43288340sm26457054c88.6.2025.12.17.02.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 02:21:11 -0800 (PST)
Message-ID: <1910f4b6-db74-4c86-9010-28ab4462c5a7@gmail.com>
Date: Wed, 17 Dec 2025 02:21:11 -0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARMv7 Linux + Rust doesn't boot when compiling with only LLVM=1
To: Christian Schrefl <chrisi.schrefl@gmail.com>, stable@vger.kernel.org,
 regressions@lists.linux.dev, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, llvm@lists.linux.dev,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
References: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
 <0705db10-3cbb-4958-a116-112457f9af6c@gmail.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <0705db10-3cbb-4958-a116-112457f9af6c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/16/25 06:41, Christian Schrefl wrote:
> On 12/14/25 12:54 AM, Rudraksha Gupta wrote:
>> Hello all,
>>
>>
>> I have the following problem: https://gitlab.postmarketos.org/postmarketOS/pmbootstrap/-/issues/2635
>>
>>
>> In short, what is happening is the following:
>>
>>
>> - The kernel boots and outputs via UART when I build the kernel with the following:
>>
>> make LLVM=1 ARCH="$arm" CC="${CC:-gcc}"
>>
>>
>> - The kernel doesn't boot and there is no output via UART when I build the kernel with the following:
>>
>> make LLVM=1 ARCH="$arm"
>>
>>
>> The only difference being: CC="${CC:-gcc}". Is this expected? I think this was present in the Linux kernel ever since Rust was enabled for ARMv7, and I never encountered it because postmarketOS was originally building the first way.
>
> I've managed to the get the build setup for qemu-armv7. For some reason
> I could not get past the initrd even on kernels that are supposed to work,
> but I think that is unrelated (and not a kernel issue).

Yep, I just got qemu-arm working to drop into a debug shell for now. I 
have to look into why other things aren't behaving nicely (but that's a 
problem for later me :P). For now, it seems to demonstrate the problem 
nicely:

https://gitlab.postmarketos.org/postmarketOS/pmbootstrap/-/issues/2635#note_521740


> On the linux-next kernel I didn't get any output on the console from qemu so I
> think I've reproduced the issue. Changing CONFIG_RUST=n did not change the behavior.
>
> So I this is almost certainly a LLVM/clang issue and not a Rust issue. I'll try to
> do a bit more digging, but I'm not sure how much I'll get done.

Did a little more testing in addition to the testing in the gitlab issue 
mentioned above:

- Removed Rust configs from linux-next/pmos.config -> didn't boot on 
qemu-arm and my phone

- Then I removed Rust dependencies from linux-next/APKBUILD -> didn't 
boot on qemu-arm and my phone

- used linux-stable instead of linux-next -> booted on qemu-arm to a 
debug shell

linux-stable is built via gcc:
https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/community/linux-stable/APKBUILD#L179

linux-next is built via clang:
https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/APKBUILD#L68



>
> Adding the LLVM and ARM lists to this conversation.
>
> Cheers,
> Christian
