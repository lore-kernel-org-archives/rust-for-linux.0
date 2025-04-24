Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD07F288CB0
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 16:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745512918; cv=none; b=IsyUic9stGaVTxXzfkEO8ZVvFEdkqnZnkzHg4HEYJA0XQ2e0vut/ezkvKkgOuhdMNW1sRSwNrlPlsSq+prtH8DopDqMPXmMIS2T8c2fXIwsNnGlcAMwym9apJg8PRVicdLVPuOyevU4S2zvnADg82xwjhMKeP7SewjHghXl5a8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745512918; c=relaxed/simple;
	bh=vye0Q+xd1G2Olnf5Qkr8nib/GWDRlQm+UGeZYjZUyDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWh9f1sLEWmVYofcoUrXNhEB3do+pJOY0+3BHNDdhsZZAASxcLS5l+1NEvt3om8+LYAlvwNq1tNBaKgTREcu5Rf8fzcKH7vWf5ugqhLwkggZYvJF7J0vL2TPaYkqBEKhE2bpEPmyfIVTEgEXfGtWat/MUvhhMX5m1C5inieDe1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=vt7T0uzd; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="vt7T0uzd"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-af579e46b5dso876174a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 09:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745512916; x=1746117716; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k6m4QSCkOjvBeG8/Kperh6wZuRGbtha7PIChY6FuIlM=;
        b=vt7T0uzd3xCze3Zzyzjt6oEBKu5b2AaMF+bEL0x1WfJmo4ncPEEJHxQG9zfcis/Kwx
         xahjvt8L0fz/GsUWvTYMadKC40Y3zgw5Vj/Bg/B+E9IfGRpYntx5JPA6qXHyXJywlCbw
         biLB7vMtyYOyIxwfNlsW2xGWIxIU7Mq8SCI1F/1SnDyWqTzKzLDLl3U6wnksQ8jZfj77
         3YYI4PhAenG/mAaDMYSsi4PkpMu/k1Hi7XbYXadK3K3CXlDrvFtQjLVaFQ/APbqalqcZ
         uGCMIyBp0jytuhdm4FN+sbkfo2YPgMosChYFZjXIJ7F2OiHQNGi0YRlu1TUMK5rxwd2g
         fGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745512916; x=1746117716;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k6m4QSCkOjvBeG8/Kperh6wZuRGbtha7PIChY6FuIlM=;
        b=N9oFVPm33x/2hqUpHYSC/SgH66vuGHtkS3g3DvTQqx4nRuM12ay15qrLoyyqq5/w0D
         hVW3dDQMXbEfaMx8HaEkEMwgF7erABogRYNw29CEskcKY+w/XcuzeTbsZl5ghnnI74rc
         tEReR3sHe8wfa8DBQPZahLJorXMhkdJ2KXOILPHsFPUqeiIGSjBAkSLj3xGu6DDknOzR
         UfXzWpCI4LhuFD8nmVuwA1NpQtCSyZJqmi4EIL/YxswOm7aRS1GhDW/5rmxf6ud8QS2w
         GecdW3tuoB/mn4YyHzGZ2JIh63iwe+LeU/l1bsljLWDtrHi8T6NJ1d0Ggmpikju7Ml8I
         cT0A==
X-Forwarded-Encrypted: i=1; AJvYcCXhlW4ZmAnrgTp1mrHFPW2iSbYlTw9S8+577DqXy58enNTPt9kJiVGmaXRPYVMcFMNjZ6GuOCG+gXwIezNung==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB6a95WVlpqweeOT9/KznMHzxKPTQRmHAGvBjCsJxZE7zh3Id2
	hmQzg6vLFcU5ZEFI9tDYjPkn3xLVBAKr4T1OwPjyRA9P14EkvX2p5OEVzWTFfbg=
X-Gm-Gg: ASbGnct2EFbmCRxK11KDz17Lw1cYkNzNi9tX0/hdVLCYhvbgais69gDuP8CnS8Tdlz5
	Gc9ENtau2lt34qhOYJRMvqLfEAqL/e+yXgZVoaWIeSeZsXxLJ2erYrfsOSD+T4e5uHv0kGb7WEu
	np56w7/r5dlOj4g4wTcU2qvuDiFSrhE0Sx9hUNEJ5COjCpoW3i9OmpK4WYGh1yMGywd8JqNozUZ
	74rt7soqh3Znm/XbKqAH0jbTNGxbVwlTPKzuNl6Ftp2p3y3UgNyhBTJVsWsvVTMqJBAfCF5xElt
	nKlxGjARDYTGTxqI93Z6pUkH0OmNUwspUm0dxkQiYtCXm8V6Z9E=
X-Google-Smtp-Source: AGHT+IGxyp+KENwVEkLGrt7S8pn2vlKD8bBJVWEd1Iv8ULUIPojD/9R2kqNR1Mge6+txkrxVbJHCXA==
X-Received: by 2002:a05:6a21:6d8e:b0:1f5:8072:d7f3 with SMTP id adf61e73a8af0-20444fc0e44mr4794400637.30.1745512916109;
        Thu, 24 Apr 2025 09:41:56 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f76f48b2sm1462741a12.8.2025.04.24.09.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:41:55 -0700 (PDT)
Date: Thu, 24 Apr 2025 09:41:51 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Miquel =?iso-8859-1?Q?Sabat=E9_Sol=E0?= <mikisabate@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org,
	Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v13 20/28] riscv/hwprobe: zicfilp / zicfiss enumeration
 in hwprobe
Message-ID: <aAppz5o2i4SQKU2z@debug.ba.rivosinc.com>
References: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
 <20250424-v5_user_cfi_series-v13-20-971437de586a@rivosinc.com>
 <680a0cd4.050a0220.296475.3867@mx.google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <680a0cd4.050a0220.296475.3867@mx.google.com>

On Thu, Apr 24, 2025 at 12:05:04PM +0200, Miquel Sabaté Solà wrote:
>On dj., d’abr. 24 2025, Deepak Gupta wrote:
>
>Hello,
>
>> Adding enumeration of zicfilp and zicfiss extensions in hwprobe syscall.
>>
>> Reviewed-by: Zong Li <zong.li@sifive.com>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
>>  arch/riscv/kernel/sys_hwprobe.c       | 2 ++
>>  2 files changed, 4 insertions(+)
>>
>> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
>> index c3c1cc951cb9..c1b537b50158 100644
>> --- a/arch/riscv/include/uapi/asm/hwprobe.h
>> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
>> @@ -73,6 +73,8 @@ struct riscv_hwprobe {
>>  #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
>>  #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
>>  #define		RISCV_HWPROBE_EXT_SUPM		(1ULL << 49)
>> +#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 50)
>> +#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 51)
>
>Notice that, as it stands in Linux v6.15-rc, this will conflict with the
>values for Zicntr and Zihpm. See 4458b8f68dc7 ("riscv: hwprobe: export
>Zicntr and Zihpm extensions"). I'd say that you should update these
>values.

Got it. Noted for next version.

>
>>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
>> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
>> index bcd3b816306c..d802ff707913 100644
>> --- a/arch/riscv/kernel/sys_hwprobe.c
>> +++ b/arch/riscv/kernel/sys_hwprobe.c
>> @@ -108,6 +108,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>>  		EXT_KEY(ZCB);
>>  		EXT_KEY(ZCMOP);
>>  		EXT_KEY(ZICBOZ);
>> +		EXT_KEY(ZICFILP);
>> +		EXT_KEY(ZICFISS);
>>  		EXT_KEY(ZICOND);
>>  		EXT_KEY(ZIHINTNTL);
>>  		EXT_KEY(ZIHINTPAUSE);
>
>Greetings,
>Miquel


