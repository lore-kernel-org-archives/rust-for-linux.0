Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6905236B903
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Sep 2026 17:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615842; cv=pass; b=FNKPq94TdON3j4X9tzYgUEZ5TQx8Dwr+5+rsDTFh671M/VT7XdLGHrbq0INCAiul9Pl4Y9yHITBiDXZWFDCJSi8Z+ZO7beLRp41xFPpyNr0Hd8wCWR94Ig0C+I/iaNqFh2uFZw/edOBS6OZTHhi4L6iM/nbwCsuJSkgEwuL2Hsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615842; c=relaxed/simple;
	bh=UyqntIiPxC/vJFVio3C1PXsVCPlN47xjv622T7oLz7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SPra9qWcHQe28kl5G6qF/kmuS7zp6o1SCWmvhHtTZalWcAPUwljkaxPLVhYjwigcUZl7emkmUS1j7diPvwGMnmO6tCz82lF/LAGZfVSdbSHP2CpavJjXWi/iurfAr7+MV32ISRHHkdAPUlgBIBIOFSxWeG9H77XYWZAX2c9SouQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zdlq+bpe; arc=pass smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zdlq+bpe"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d6ff23d82eso2604305ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 28 Sep 2026 10:17:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790615841; cv=none;
        d=google.com; s=arc-20260327;
        b=mi8tPY3SE3Vm3Uc04HJqQ20XLwhY+bzS16VwpZHYOdjfkKbCYhu3Vx54JLepj0EPS9
         6Xo6wiS6a3Wj1hslKy9R8KQZiYZqzFyifDXvRZjKYCg7zC7E/cQWqGFY0QL9J7EMomJa
         W8fT19XXzq5N4bGJqV5Fkjzw22Tmy+nqftpb71cUtXwiwRTUOW5pCTj0z0pQTfKKawGE
         wmu2eE2423pU++PE0njkyIjVOmpcHL0KutLt7Uqvz3fzuTpcWjNHdUzFvyp5nvPgsHxW
         qiIza2zGUAETZacnO84C/YOGQmpMcQFeViSwc9/N+9VLRLV2xRJsFfaOCUOpVKPRTTzF
         TmIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UyqntIiPxC/vJFVio3C1PXsVCPlN47xjv622T7oLz7k=;
        fh=MYRHGCtgEp7FQ7QHm5fg3ceHTh9K5nkflcNkO6fYizs=;
        b=jNJ90N1o81b5rGHV0qi4qVy/W8Lz2Q2GKZATMCO+ieYQBEgCDGD6XFevsTC6NPTv7+
         ypq1jr2wm3ETZP4f4XDE0xNxQ/9mnQhggML2CaQAtzLKqB4/v0o8XSd6NhZMpXDXwS2J
         PFYtkXTIaiZ5cTZftHu7hnyZt2DuR18smVLHRmekq7aA4eGAJRLjtIyuy30Deys+mcbF
         AceeMXwgnhoANyfkvS2nDvpKHPm7FcIijGgum0nrxXFsOPLvHJ0JPGroXZZi9sW7MzTy
         oLjIj9yJCqSb0cnWiKAF3UC5tSkhR7KTUPL0TNmz5/KIvmFZblKxPxYRiwdiW5sZiRRF
         Jmbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790615841; x=1791220641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UyqntIiPxC/vJFVio3C1PXsVCPlN47xjv622T7oLz7k=;
        b=Zdlq+bpeL+kRHts1FA6LBO9vO6RxDaEwHIGmOpHPWL3l2+EuzQwzRSocuwCHg4BfPJ
         MrRM3yq+HfPcaCIN+cbpWLMNKHFB5ZoFwoCLuc08/xk7Nx8oiIL2E80964/A8hzTMczz
         +O+HpCjbB17ecFv+VEx5gu3QznWMkJvC7dw/b/54qseP7BKXxrTN4WjQjIgP6KQV/ugK
         0inB95S5ds9ga3Zifkz6V8JgT2i2gBoCIpPWfTIsJjtnVh3snE1we+84DssT1rz4y8AI
         dB6yNa6qOX1nEkTvfAxs9Q/G8lRTf3JKahUbN8WYreXFKOeQpcbypL3sPlVNXR0Jxm0X
         CeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615841; x=1791220641;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UyqntIiPxC/vJFVio3C1PXsVCPlN47xjv622T7oLz7k=;
        b=RiDDD6TwfUmErSEKmXDLMznaZskOm8/HkneSpZmcug2Pn3xoANN0UaSI5iQi6M1Saa
         lMUPrF8BDfPMYw0YkgSAOEZxZv5LGR6ji0k8fuSSEWGBsZU/CmWOuV8rJfvsBz+/3ebV
         /woXFL6VlUImYTrlIIpFJNmfpp7XgYBKSUovut0F9rAAwMJG2M8LUcXuXfwof736XJqY
         LyR2J/6Y/W7lJrZOdVjZjvtlS05PSKlt4RNM79upmlBnKOL3AgzWFhrz8Ti5xrYeaBtD
         WlSlSox3VbEYmhdDrI/xQ6xIJnA/79bN4o2a9Q+2Q4d1Njh3puUHZk4/zglaj6JDKhxH
         KXkg==
X-Forwarded-Encrypted: i=1; AKwUvBxfvQoLJEaZ4KlKj5yDvAGep0twLqovF+0DBhfPPbRKE8WjhFd7aU5jMwLW6Z/ZaGzE3lPM4t++sZUqlwYLyg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLXS4RQapqLTLiU4sJiYNgaXsRNELnj0ldecGKDuxyVLGJzlWxF
	XAu+oz1Xr+lJO0h+jJdEx+J3gwvxOnwHSdz5WREq/aiSqgCwbGRQh0xqXRN27i3goUPYI0lQv1K
	GB7A8eF3eFqhZqR9BBnfMx9FvXXQrk8k=
X-Gm-Gg: AYBFou2pUR5zuHvA3NECqZAaCOxawkqP/An28KEe8XcqTUGpvGTUreRV69fzKs6oXg/
	TjkD3KZGW0DD1SZQW4/03OsXkBURuG8Fp+qSsfkH6fhn4QQxj4n4ufgWVdFvosBlfn7iQaMHt2B
	+7BIjObsfwM61qBhCJybOaTFlMwnSMYgPepxFykWXnjTArzobM36otN1EHuG/04yB+J7mEhh2Ws
	uDaukUWSvvwvUW5aSn4TPsAQuw1vQB2eUXOGKejiQ0jj1cVrMODKenKR5zxN6I4IpL4LqWXZ2am
	YXSx8XeY8hpctPHlka/dy7+hUwoI41a8pHGFZM5BARw72gev+TzvasYozHO64fVp9FY2FQp2m4i
	728Em3A8flehMvvOODmxBEDkF4e68wdQizfhf7z1J310+80KAGwaVFZa7Htn8uKlVJsx0hubN0L
	yASLL+MXiEPLBXOTps/Y/tp773mEvOkzyrvLY0Xm1QtPXg7VdVM9Q=
X-Received: by 2002:a17:903:32cc:b0:2d8:f4d4:7044 with SMTP id
 d9443c01a7336-2df7deaa2femr181005175ad.3.1790615840841; Mon, 28 Sep 2026
 10:17:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829161013.102967-1-mehmet.mkoseoglu@gmail.com> <20260928162214.487564-1-xuyiwen14@gmail.com>
In-Reply-To: <20260928162214.487564-1-xuyiwen14@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 28 Sep 2026 19:17:08 +0200
X-Gm-Features: AclHuK9Oi3HYdpfBssBZXi59FnPj8n8w5d4DbZjLEM1vQmIq2zJQWHOZwy-yEls
Message-ID: <CANiq72ki8M1KmxhO4vSkMUfLcuqOMvZtuTNdDpS-UcJy8rqWpA@mail.gmail.com>
Subject: Re: [PATCH v3] rust: cpufreq: reject NULL from cpufreq_cpu_get()
To: spidermana <xuyiwen14@gmail.com>
Cc: mehmet.mkoseoglu@gmail.com, a.hindborg@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, gary@garyguo.net, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, lossin@kernel.org, 
	ojeda@kernel.org, rafael@kernel.org, rust-for-linux@vger.kernel.org, 
	tamird@kernel.org, tmgross@umich.edu, viresh.kumar@linaro.org, 
	work@onurozkan.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 6:22=E2=80=AFPM spidermana <xuyiwen14@gmail.com> wr=
ote:
>
> Either way, looks good to me.
> FWIW, I hit this too and have a reproducer [1].
> [1] https://github.com/Rust-for-Linux/linux/issues/1258
>
> Reviewed-by: Elowen Xu <malanalyzing@gmail.com>

Thanks for taking the time to send the tag! :)

The From: doesn't seem to match the email of the tag, is that intended?

Cheers,
Miguel
