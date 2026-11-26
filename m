Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795668789;
	b=IoKVR3ANwcezY4uJiguOd4fgAywb+qr9ObjL1IO/H470EupxLwr7p7fTKeqnvmmsFhBc
	 62kVBA5gWP0IzdINsx+I0AyurloHc2lZv6LeJ7tjPe6DLRZ5HGbFVoV5ID2dhBMSro781
	 fp8HuKhvcH2UODDL/hjByXBKouMIxsHsDWR5d7emgiP+/It8kdr8ZJazyTBjjx3OrVE4b
	 PyULQvT+h5RjpbrGVhZ0E12IM7v9qQVh2iJ9zmiARoK0OtZ1iUJj4/ATY+MeCOsD4z0zy
	 TRtIlidgju06q6VnkCmRLlZiNcs318l4joWXAbBGBNL5K1C0364RkdyEQxa16IS/gGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795668789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
	b=QmU11Z3wT0ZFh1OSGmtfSSGSNNriXrBFcSFCGB45eAu5HacbRUVB/4GBuUTsengPXrPw
	 tGdB2OJMxZX+aju7Nl9gnSpUHKWJI/TpDuHqqcnmcbSzkd5VhJEDJdWhXhyvDbIo+D2Dh
	 RI/iR/EEkHtKdZIAKnaesj1uC/Q+DMgWrOCnjo+1Yo+8mL3zpQfZZGpMuo/5Vg7g2DRyY
	 tFmr4vN1nLMUo6tO+dAVS+fE0N2aRzlGIy3Iwv7gyRhzCjn+cZI1F6klcZuriLCWyIqEc
	 NlTwzmvPHgOcyJmQIHGutbBpcMd4eL4+Fyw8kw8RfV8KBcwajEKm9NYVTzi5nUJaCQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Wt/H8uEX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4926D606A323
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 04:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4926D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wt/H8uEX
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-55c7445cf85so1380931cf.1
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 20:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795668788; cv=none;
        d=google.com; s=arc-20260327;
        b=BwDHcH+lc23lWo0DQtvD8U7cAfLDcOO4OMj8v9ANPtTyGay9XoY7B0wEKlF3HDZlcw
         Ff5d3ViBOa1dsKyERMRXOXYHTgS69eXheVA4H1KW2AB4dnwUPuIyOAsVHeEQLj9wkdhD
         sPRcfdHwP6yzlHA7sKJYIF5NVoIRCDwUGA6N8+RVQQoIQ9X8/QXDb19a1uRDKyy9nHoz
         70k2kPMG1DLuwFV2yPFGbqeNT6/8aDag6oS+GQf6JEr4JuiHvDeZdCe6wP4sqfW26YIV
         ScADJHD/sLSANd9eK7Us/RmMmigrQGZ8u7HB63V6x8/HH2fsSPNi9zxWEzebCQAdjfEL
         r0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
        fh=qy8r2k7EFIkPq0IiJwb2e4xfPMtw4ehCwAvm4+q/N3c=;
        b=h3kilP7OkE5UAQmFrq+7azZOACUSUQnLpdRj3X7XAIfzw9dyeFopcvSQQZ4DG8lxxJ
         +Vgj6iw6176j4VJBr8yo8vK8lK3YfSHu5DNINGlxOIQKEhR+9meT+tZVzD1/9R3IpceK
         8Ee6kJMmKLxP/JTpy4fFOnHkhu5pp6CYPz581yW6XlRJe1NLwR7z0qky03VyTJ5qaYY7
         F9zE9H6i1fgNert+Q96F64xhLf80Iglw7pfRhtwRxovyiwpJhFNCMgJTb/yvib2LotBm
         UuW7Dd7xMXXB7uP4OCvmVQq1E2kakQnkWUoekdXzaaK9YlrYL2CCPbdwHNk+61+92keN
         UeEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795668788; x=1796273588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
        b=Wt/H8uEXeygfnRJXsnha4ogYR4WFdKKtucv0h74Hl9SvZ7ZVOZ8pyveIu/m+bbBuqU
         7pLEkyr5FS02oSIkkEdcPGP7aMYZHs2eR8ZbSslwbXiv4nig66Yw9zXIl5pT+EHlNoMU
         cQHBNyntCt6+GiY4hESZ00/HEKXKxMOneQnWVqwJdquEVsZ01fF3oKFb+IYLDHDd97P1
         5iwuBre8QUjJjwbIhiuIlmYLUamd902f2vsDR98ELoNLHrtAN91EmUr8k1YyhoPYh3J/
         v+aNlL3NNgtJeSDZE4JVJM46ZiSMrhfEMHEAp3euRyiB3I6N1f0aZKatBbawmZwgSrYV
         rmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795668788; x=1796273588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
        b=Dqlq0mPogJMxxgTyln1zELMF+WimE7noxAJX/rOnGNNJ1KKhr++0YFHQ1ItY8zDFAD
         T3YkvVs1SemV3C1nP3+cdmKbqJzrJm6+xL9ysI3IsPDrNrvuXsIjKfSkZXkaZMxwcBCk
         7i/l4Q7y4gXyuJRtnPGDFvWJnX6JEvTyRf3z92bFPyTq85cuTmGttqtTjICIDL5/9dBK
         1hH9T1DVnqXV2DXpTc+sXOsXXwxWzCyX3gJ5v5h6phnJc5GGotf2SDfu2Zfnj5/Y05Ss
         xTtoSyqIFAsuW29tSrlV0AM0ZTt4SqG9QGBnLLuY/iV9/BjOYvXGjUdG+1UoQZM6RUeN
         U5XA==
X-Forwarded-Encrypted: i=1; AL+hErH0aCGs3ZFks+weCwCPZGgmjs3KHMvj9XGFXY5hE6PF1/NQSo3U+EZxCy40tP5X/oz/THYQw2pj1+TYLTB9iA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8rvLo6/BF9/dEBF5EAAZe9gNkMEzKtr/jQGgAgncxpwmXtUKr4
	UTZ4Z3nBFXs0EqzFRhnlot3Eoe9OHUZfNt0IvIEB7/ErtKe4KKKHQpZliEvnKyDLdh0QyxaFC+g
	ViGdVvkDRdUwiKL+j910cmWga6XuehnzdTwoT1YCJ
X-Gm-Gg: AZFdTZejQKH2+VOXiMn2CeHcmSVxRv+BaJaCnSXT63ga5fiNB2p06/JaKfLBixXgrgJ
	8yhIEMALmZtOJXZazUQqdgEiTgfActDACgVDAibGj8TPrKnOLeidr18qXEeT/bp1RtuRz4BtwOw
	Fk+x6BTQvMQ7BpagK3jYgpX4fuMS7W/XZ0gW+b2AzxS8Tq+SYeT4WCWUH4jtLF//GTbNErLEr/U
	R2sLKAe9OY7utWn5XyMj4cGqx0LGRTytq3UPjDE+12ewk5cs3CytSeM7IA/HLKHvtg/07W5rRYM
	XOh1meHE8zHWGK1Fo+4a1FTlYLtw2SLvb3QSyEPTB0JLkg19/1Nf13uLBnkg10Jqv+vNEVGETuN
	pLad0G1esV5z6NArXAVlezl7aAgluLCbDTtHToNd+3MTByZcU0ROnw6CvCg==
X-Received: by 2002:a05:622a:1e86:b0:536:3ee4:81cd with SMTP id
 d75a77b69052e-55d88127bafmr101738501cf.4.1795668787640; Wed, 25 Nov 2026
 20:53:07 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com> <DN4FM3TBOJ9T.2QOOL77P5HETO@garyguo.net>
 <20261125132225.00254c37@gandalf.local.home>
In-Reply-To: <20261125132225.00254c37@gandalf.local.home>
From: Ian Rogers <irogers@google.com>
Date: Wed, 25 Nov 2026 20:52:56 -0800
X-Gm-Features: Aa3M54pMQmXw5Cgtc0EakW9NOiIZs8STgUuBigJfJMSZlzejGTE6XZMetCnzc-8
Message-ID: <CAP-5=fWkUW787c4dGx9rccucqD67dfRgwBB_SoCxFnfZXtXP-w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/30] unwind: Minimal DWARF CFI unwinding for user
 and kernel space
To: Steven Rostedt <rostedt@goodmis.org>, Gary Guo <gary@garyguo.net>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, jpoimboe@kernel.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 10:22=E2=80=AFAM Steven Rostedt <rostedt@goodmis.or=
g> wrote:
>
> On Wed, 25 Nov 2026 16:28:02 +0000
> "Gary Guo" <gary@garyguo.net> wrote:
>
> > A quick question: how do you plan to get this working on 32-bit ARM whi=
ch has
> > its own EHABI?
>
> Do we care? Isn't ARM 32 mostly deprecated at this moment? Or at least no=
t
> adding new features.

There has been recent work on both MIPS and Alpha for perf events, so
supporting ARM32 EHABI doesn't seem unreasonable. Devices like the
Raspberry Pi Zero W/WH, which use a 32-bit CPU are end-of-life in 2030
(according to https://endoflife.date/raspberry-pi ). It is
out-of-scope here, but extending the kernel and verification
infrastructure shouldn't be hard.

Thanks,
Ian

> -- Steve
