Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E462F9C3E
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Nov 2025 21:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762464304; cv=none; b=rXGZm3wEYy2lSI5+qYg7UniqXc3LaV2a6trWn3gt75uNZZ9VdmiXR6QW4RZsY6K9zpyFpqkL+Wl+0QyXRNTpEUcr+nQnZrEh8SO+c8ZlHcD/dEFrYdhUe+hWzrBZAqYMLwckNiGopYbcDZI9/UPzoZjyjBcYwfoRnvuB/Qd0fIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762464304; c=relaxed/simple;
	bh=j3o5uZtHhBjZCwpRT+vuLhEkCZ4NFat2T9UI/fTlUyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oSFXRW4iKW1D2qJFm90wq1Yz7He/vNvIQGZrpYrbefe4B2EcaPJj3ApdHjAMLTPyk4GDi+yWJmdiDLgHnXIJl4eO9YWrXO3dmvsYBDUwtBrh+UVf1xTZ9REaSRadehmbnGzeJ2ZuCkU9JPqU//FUg2IDdWf238vb2apwk2hR0nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kgX5FFoN; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kgX5FFoN"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4710665e7deso336165e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Nov 2025 13:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762464301; x=1763069101; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YKes0XVjNGJ2FggkAmqRR788Mxk3TjUGRm3n1mueSWg=;
        b=kgX5FFoNdaKNGVjeY645WilSfvJtIRxpCgsAfnPiUruE0PuJFyEKdPEYlU4QsHEPPM
         fTcHbfTA5Tzc9QKx4zrPu3Cn+gkh9IOAsKup/pn1CDo7battPX3wipdw3E5ZCGTzRZVU
         E7cVhH2Nu+bn5E9FRfiRCdyukBfsQfBQzpni/RcyAvoPuHZXwoAi376zMa3QsVIGT/3p
         r5lzz4G5STiWNMUdr+HKoGMleF4qW8bN341PaXUPLl9ieWVACrnnFfjTFDR4b33nX84U
         JF0KCuIOzbMX6XFUjh4hoNVJluB/2KRwNWAxv5mYpcIPUYD8Tn2q0yhzLt6U7rUuH7Tw
         m8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762464301; x=1763069101;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YKes0XVjNGJ2FggkAmqRR788Mxk3TjUGRm3n1mueSWg=;
        b=ObdZm0WP12uThlmfDA1nTmkMpXFkWNy/3d3zUaFMdd/d2Bl/hnFMlbag+gZXqOyGCR
         CkEF+eoDa5P6NSbN47aZngf5k01AA5uZ5Z2viO2sOieT+2X/sWRO8QIVUz29PvNTb5F8
         uuQ9Hx6XI8DEJ33K0DfjFUZOZPMpr+Djd3m8dU8YbV57RIk0V5nUzZlfsgDUXsS+79I7
         FqBPwnJbnRoEMi8iFyVsL7nODuz5woGbtvp0fZMA2f4ml6eYJkwlVE69eFl20KPXqUn6
         kktU6U7ZWRklPZB36pF8ieD3CSbHOJvuq3MP/0OERVcRc8VABWAgKbMTmIz1ryDLlS6k
         rhiw==
X-Forwarded-Encrypted: i=1; AJvYcCUT2MSe6YGymb/durAovFB3vXQJwG77N6eToKSA4F7IltXDseh38On5YfaDOdjAHjEWffxVQVIXuW7809T4Tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnVG1/dRHYVRcYr71kNYkE9GBhJj8o2hQFU1PA+3XW+WiGSmvO
	zvOE/zfkaCpprHFWx28arojGgpwiU6iMv6YAJpLZpqMYOxNMRk2U1e9+
X-Gm-Gg: ASbGncssZtI1fQ040GR13TRnVa6QJySiawl0VWh1hCs8iUBRZYMvWRr7qFtwz1JOext
	WDmAXE4YCpebWvlez/ruvINHX3d5hVHfjvOOlv/Bif50hYaO/3QXG+z6wZhoISoyJm8a8IOCTZy
	fu90xdqNL/4BvFCi0cJEda+fUwciLIwKreqlxC8N96wPwHqSr9eaE8CDybUvfkgJ2LIF1G3ynWq
	05DZ5X9qzcKtuIlAjytG4cb/ur9kLyN8EVXa0inOjiut15J1cvjRU9T+sDRZnwfE2xehVeUgOqO
	tOr1JWshz/nLpkgENomNPorvNQfPMJLKA9fFNF2UEK8Swk9xY2UIi9RRm9Nryzsfy3braFPhwye
	EasHKytWsQ16x8T/b6WyOhY1nFGLXipVMhlma/J6qQ+czeVHVlxZbBjTBsd1+M7KE8zs+/lTa+Y
	8vgGEBtDT6cxGhr+38MUJLKuJGdxt2il0N8dPrOw1YgvtbzMVMGCFhYlNsUNz72yHrzLA=
X-Google-Smtp-Source: AGHT+IFRtleD8p3GDaRn7y4cLlgvtrJ8k9u0N/dFUXsYAq553rRak+Diry9dTEA+SBjhoD9RJ2Xd8A==
X-Received: by 2002:a05:600c:1384:b0:46f:aac5:daf with SMTP id 5b1f17b1804b1-4776bcfd091mr7371805e9.35.1762464301183;
        Thu, 06 Nov 2025 13:25:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:acc:bb60:756b:64e3:20ef:1d08? ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67920fcsm1257502f8f.39.2025.11.06.13.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 13:25:00 -0800 (PST)
Message-ID: <ff95096e-83de-433c-9048-55a35dab3dde@gmail.com>
Date: Thu, 6 Nov 2025 22:24:59 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] nova-core: Simplify `transmute` and
 `transmute_mut` in fwsec.rs
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
References: <20251104193756.57726-1-delcastillodelarosadaniel@gmail.com>
 <DE1H0USFAGNU.FFRA802H95RG@nvidia.com>
Content-Language: en-US
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
In-Reply-To: <DE1H0USFAGNU.FFRA802H95RG@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Alexandre,

On 11/6/25 09:32, Alexandre Courbot wrote:
> On Wed Nov 5, 2025 at 4:37 AM JST, Daniel del Castillo wrote:
>> This patch solves one of the existing mentions of COHA, a task
>> in the Nova task list about improving the `CoherentAllocation` API.
>> It uses the new `from_bytes` method from the `FromBytes` trait as
>> well as the `as_slice` and `as_slice_mut` methods from
>> `CoherentAllocation`.
>>
>> Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
> 
> Thanks, this looks great so I am staging this series for pushing after a
> short grace period (probably tomorrow if nobody screams).

Perfect. Thanks for all the help!

> One nit, the prefix for Nova patches is typically "gpu: nova-core:", but
> I will fix it when pushing.

I'll keep it in mind for the next time ;)
