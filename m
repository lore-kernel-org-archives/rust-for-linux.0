Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF583BD65D
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 21:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788901593; cv=pass; b=NyfcrObbue7SVd2mZ3herwcHPgXcvS9zYpjDRmLrOZS3VPdVwmc2/QWk6TjKW80qWxWyqIZPIm6zYiJTVPt1oddQXUQoAep7UsQSpigvwYRc4NXko0F6/AFVRDcQuRyeFxZwsUHLu8hhO4Fc4IKndHwZwy3/Ky8f1F5QwaZMXfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788901593; c=relaxed/simple;
	bh=cIOFXtCuNna/zYNDEeDAmAkgX9xNg/vNmHFdct8PtpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZoG5nZf+Tafp2FecC9fy6rLLKsOV70AqILfKP2QaCqrOmuT1vO/NxtaVLvET7jKa3QY/yByHaEYmy/d3UzE52N4BeYu8ZkGrS/ht0MHTPXXZU1+iFmGp6FlElmqjJHzNJ/eZKcFZEOTQeMsQp6mx77KwM04dlmdxEph4wpI22RA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=otsf6b66; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="otsf6b66"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso75462615e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 14:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788901590; cv=none;
        d=google.com; s=arc-20260327;
        b=FFexl8mUORKSZzVflCe+Fi/xaS1tfe+wKQdiuoiEH+7+lCZCmYYwe80OUL3Fk19WDL
         agsYoIQgvpUe99WqxMsU5cyjhODGb5hfTj6sE3QKWpLAJF+ynpwLTv5N8XuJNaMwne/C
         S+rcv0bWf3y5uGFW6upVNW4E/ttJBrnhGsEvw+Xx+anpp44zsiEXBTFQY+P1QvTyGroD
         jSaDUv2zpbQ3Cgg2rpIlRmhqlQ/d16t8LpRlzyBYp0jm6I2mNFHeLuK05eXnAE1KIrrq
         hd/ZdODdyFEuC91g9+bx8NvDmm7ekabtz7OfbwIHSTcrgb990DIzQiyHIHVC0Y0+5hkR
         QEZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/CB3Vtp7eYFgiX1lhWfAP6WjiIrj8nFLFrnLp7SXQSY=;
        fh=graNB+/TnWyJic1Jn7JT9vIn3YCPNSCIj1wUcOcaFX4=;
        b=FzFcZ/Xbt+Ide+E+N8wAJ9DvAVbZ25r171GjiKOq+UW/Ughu3k1sykSKt820dQxIdc
         shcConNrAYSuE2l7oeu7rqLUz4F6Jqv+iia1Nz/OIuF1Lqxzhk4TjGnX8GZS4/FzOcon
         ByzMWQClakkl2PeKP/EP6XkQwQ7hYvc0XC24hCrotOltYFFgwTTmJnhYAwXbxsLGFn3a
         VBot38k38Pu6RDlbY/jTIa91XJ4T9ytCHysR2KfnwAU3AvLjBmUAAFgEj+7ooFePZfZc
         E4Yv+SEvkJnZivAEDc4nvX1FbmLP1n35YAnN8QBQ4GrtCGariTWs8WtKPq5O8BV/Rhhe
         CEFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788901590; x=1789506390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/CB3Vtp7eYFgiX1lhWfAP6WjiIrj8nFLFrnLp7SXQSY=;
        b=otsf6b66eLyN+62lzguVV+VBMlATv6z+svgDrA31hnA5b3fBV3bwYCqshPtnmsyGmv
         QDNDZwx7N31zA+x89VYITcROT5ZRN8TP4ggK6R9uMannUm/MUJSMRZGWkbAMzCuOqlSY
         H6biXYN3dL5DiY2yXed6Ky4yh4BVxXR56j5VYoNJgh5pu6nlbLx8ul8LTxw6ojhP81mJ
         6JTXwtflQYVkO/SfV7yVBVRWnh5SQfasm8wlbFkY625Bkt4jmQ2QbNf1ssWLfzh6NMk7
         l1RjM2KYlCGn6nKE0yFuTlHEHgKavdGE6I5+Sqelz5oi5Z+IpMaKNlUCqzRnSjeVC5x7
         BuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788901590; x=1789506390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/CB3Vtp7eYFgiX1lhWfAP6WjiIrj8nFLFrnLp7SXQSY=;
        b=Tso6NSjqX5K2YXoGlONwT49Hh5MLra6wR2vA1E8FCjPRsh8/WyD3JglsgEvirQNs5Q
         h2rj36NbtJ50Zt3Rcrpaz2jiGPLIAKqlB+NUPk4Db5q2OeoQ9HoKVqstuAN/UzloNsme
         1+itiLwbpguPmFSo3I+sC6A8vcqBlP2JLYYzedr53RXqajD42awrgWBWveSnEKqNyxuI
         ocGbKHnABnqazt44PVY+9lLTZhJbCgZDKKJI1LTbUMa2x8P0EslmRa2dpyoocKBfVTr3
         Ct/WW6O2dhcxEbEfC8gK+u3uCjgteUfE4OjjXI+WSZyQb5i7mpYu0MBhptuj0qct3Vf7
         frAg==
X-Forwarded-Encrypted: i=1; AKwUvBx1rEBVUi3iM7O37wSEpI/qEZkq8vYmqBMJ4LL/WY68c299POCX1Sy8oMI0FZDGuuTTfrACQrxmeGiHRofOJw==@vger.kernel.org
X-Gm-Message-State: AFuF++mNZc/jpTLpNlpZ/RV1Eq/5g/iDUkJDDI18ksv/cCEP7zYf4cAX
	ky4y6sLxnMf5qSlLCk0K7AWxLjVnEiqNyB9HtyXkJvcO7PcPsbZxUGI23eD+RVJUrYtquGmZ17u
	//84ysgGZlIf+GBD30cL9p8Sl163MfIt8mS1CGpA0
X-Gm-Gg: AYBFou04PTaGXvgtxtqNEI6PcIyEHDKkD3pfsZLba1W8EEuZFpnu7rMrm3DFHWWCcBq
	7nDJZxIPbuQNTeqKzKVnzTi56lpY8Dajav2MsNY1kIzxVsItUmi0b5wGQd7i6QYyiIEKNR4r7rX
	BeCQupge9beJG5/GAfBOD/66BH6E3BaVgjzqs7lr/QncBPtc7KKHVdIkrRy9TGCdNjuQhj9ecpC
	QqhfdsOUcMdt+pp1Bh5u8mNvpa/p+4nFnk9d0iX/aMtPmDx+7kMyMJ0CLaQb0yJkmrGViKbFl8j
	4FGgG3xY+Xw8/MS+qmuG+/hPMkOjg7uQ8aI0zZUzZ1zD43zdn1qbdMrZa2RYqk0qZwbIsY2D2zQ
	BZIDp4KJ/x5LV+UM25y00e6A5NltT4uAoILHGoB/daI+KBRe2TgkmqDxc
X-Received: by 2002:a05:600c:6091:b0:49c:eb17:cf3b with SMTP id
 5b1f17b1804b1-49cf8252497mr286154405e9.8.1788901589479; Tue, 08 Sep 2026
 14:06:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 8 Sep 2026 14:06:18 -0700
X-Gm-Features: AcwNN1Vne6n6eJi0vjoX52mygVY2Bf7Bhttyek2fKXqRHQxDJ8Lg5WpFcLyZtjc
Message-ID: <CAKwvOdmdFdW8=y+s5NLoNeKz4LVbmW8tr+JqJ26wqYFJDdARFQ@mail.gmail.com>
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nicolas Schier <nsc@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 1:55=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> A typical kernel build consists of a frustratingly large amount of time
> spent stuck in single-threaded bottlenecks.
>
> It turns out that there's a lot we can do about this and doing so
> significantly impacts kernel build times.


> Fundamentally the series improves build times by parallelising
> single-threaded tasks as much as possible and improving the efficiency of
> code used in the build process.

Cool!  I have not reviewed this patch series, but am supportive of
solving the problem, since I do recall this being an issue;

i.e. it always annoyed me that despite have a 128 core machine, much
of the build is sequential!  Having all those cores and not saturating
them during a build was always something I noticed (usually have
system monitor always showing system load, always) but never had time
to look into.

It would be cool if your LLM could generate any visualizations of
what's going on during a build? Seeing what's serial vs parallelized
in perhaps useful. Particularly when you can compare the before vs
after.
--=20
Thanks,
~Nick Desaulniers
