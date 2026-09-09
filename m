Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CC8489FDB
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Sep 2026 22:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788991766; cv=pass; b=KFz0a0p83FxmEIShL/1wVzzh4jYF+eubKHS+nUNgox5nvIa/931iQ+Z5Q7ZtZTaqoMERPDwPLaIN/ikF243YHEOl5fOXLIsX9GG3Zo7Akx8zYLuHaElKiJV71e0N2N5ucRXwP4tZntb0ELjysPDbyf6e/EPeaQWzliK7xpheaGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788991766; c=relaxed/simple;
	bh=bvzxaEfHxbnbItUGjnix/CzOoHNfP6Agb5FNfRpjWL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XZHHrFMQHuUwlhv7eF7DGji3chg2X0sthmnMDUvz5UxIdQMZKv+roL3ImVBvxyPZgysZg1xbUKbF4Mr8zZOv9HucPsf4TDAXEkEyvLm+ig6w75h/qW/cUWLO1rHFVUT+ovlbwvbErPCqYIYwYXT/0AAsfGmT2BJBZz9Y5dfllb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hJnHmHhe; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hJnHmHhe"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4957eefd361so50576965e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Sep 2026 15:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788991763; cv=none;
        d=google.com; s=arc-20260327;
        b=ksCoe8Ifa6GFGOyhjST1QvG0YRCo8uOAUzjV1fFcOSxK4i3Ctt59h9HF8oYco2yk2+
         lX6YDjk2Z/MJGNOvnk9QUPDKf+sEAzGUQapeu3eRNPbB0HNXLMleAcqIof68StAGLZyR
         8zUGwwRWjb56mDBbXT1byetS9BAqnM41mMBm+mHoxdSe504vfNO8Tr9Ym7jo/WKzaK0r
         s2HOr57wePknCrn7/p/p5Oufo4ZM74cRmOSF4l+eB/d2211rig5sZu5JftDoHBAI9oiC
         cO8CIVnOTWUb+4J68rIZaq1GIIcAtmPeahj1JK84MlpOktqu2ZIxcV29iaLapY6kEzMY
         bj3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bvzxaEfHxbnbItUGjnix/CzOoHNfP6Agb5FNfRpjWL4=;
        fh=GxgksGOEINi32FEN+6Ejns4NAizYNmRfwQEArNMGUrI=;
        b=i05ijk/xX7Keprsa1En40DCxYxd40AED1Bdt6JrDFpO+9IkKtyzHboWGi8PEo88FP5
         96RzZ8mqxjyNURe5ESG9UtSPDx4MP1+5JSjSBBOPHpat9m/qXzOXYafyed3SrJdlTawX
         oHtdsr3xU5TxuJM0NP9SyR72uGzA5/XcRgxEPfkCGOXNWOH0a6E3fhvZAA1zQ9Ez1wTp
         QxQe+In38BVGCS/i0PmaKzvoojJeIqUdX/Te7qqyZpP60WbiRTzNnoaTY1Ac1yewxb/t
         AtPHsvQK1LE5yN7pPJQDMrc6H0+nzE+YP5NzotnC01yJwxzPU9GjV7L2nYC2wJI+sAoc
         DSog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788991763; x=1789596563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bvzxaEfHxbnbItUGjnix/CzOoHNfP6Agb5FNfRpjWL4=;
        b=hJnHmHhe+3Z3B/o1b9i3gNkm/aDnbsezDcQyviqY7dy1zsxKPyI3bYCDtR1pjVAytV
         yhiu4H+vtxVlBhhNE1bQlb6f7a48UllOzIPrYLGGCIAN4VhfSbAXPRCETqRmpiSPDTOv
         rWJDZaqFYHjuluIDtrEYzUPixzXiqxS/D9IuWtdGQYfHep7KfZZ14736P7EXNQpqVW08
         pKn1RBFdnG2451tR/nrEy7dEFMergprk0ekp8fLZLbsiP5bXRvyDoJRneG3y2J37tiN7
         kc+HMdzfao1r9BRM3SH3gaRbanbA8Sf7jUGn/rPWRtaAzSNYEBIxyhaqePlgxLqEmC+C
         bNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788991763; x=1789596563;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bvzxaEfHxbnbItUGjnix/CzOoHNfP6Agb5FNfRpjWL4=;
        b=UFVHAB9RZO46csYGxZ38S2n/YewuAWMs8Di+b9N6/5HGJmax5yTHpn/Wuz7MP2GTeC
         bW4yXhhGVcpQVIp2glDyTZWsX+y9l2v7rBfrxlzjq4D6j9+Qi+c1/wr9gnkRDbPVQrpS
         oMfsKiQt0jrWfOSXKqPqk0Lg0YYKD8TaY5kuVAChgHkl9qhV1anQBXJkMwsjdD3FUtiO
         vA5+rNKKpkF6+MyfWTWVPWhOhjd1TV6jiVducZr3IocMpUjHFOEn4bfQ/ipppDTa41Gj
         BkGH0je1fBnYOvrGcx0aexDoi0Fn56GdczXcV+R0/TyvGkS2hrUCT1wTV6QuUA7tGW8O
         ANnA==
X-Forwarded-Encrypted: i=1; AKwUvBwwWBMnDgCE8QhuZXgWrIXaERfvkDXdUpySX3f6DOVErcRT1SgiakmJArO9mTDn4xfS4v4lLJUGsiexRK/J8Q==@vger.kernel.org
X-Gm-Message-State: AFuF++ndFlF0rS5lTbnY5Ux5aLqLG5wtJ9hSCZXxWe0dZbkeXUYzCSRJ
	s46Q6lg3T8y9MVPpDojBd3FJ3VA7OGiVCiI83yPdWljbg5mmZ1MV/In/MLN2ehrEI5vVAkLxRHw
	tmdQlSsjfFKpTQ9hrbqNCiGDwAazbBlT/cK9vEMUl
X-Gm-Gg: AYBFou3ylERmKIYZgMtuYG2QYEiN+d5hTnBNW80mtoiY5dDkercKOZhnKE1Vq0wLRwG
	86OV7Y7TSGTRYy7JVd9fGJBpptL7bfJqGq02e25KII34QWteXf1uIlC0UqAzRsz4uVqItdZwPno
	URa0ytusNirN0v4YA0dhhlXPHWyURKr0IjzUoxIADjCi1bycPCUBuhkRncELleWYaQs/2fxUC/4
	975U39qjVZKVGCJ/UkiR2rdCQWfx+gTs0X5s5Utqvl5qbKJbruRkVWtPLsg9qmEMhPl9U0o+Q+s
	SqCISUWcohn76zIG+noDcGJ1V9sP9K2qsxuTtrPn9m7pKfxo6Cx/yU0vjs0RRQ5yLUvtOaYF3qI
	rggR+HuAzjC8e6MgO/xcs6D5YoJTUa0UUJleciqUPFQ4/M4mN8w2T1RNyf7oXduStD/Qeghk=
X-Received: by 2002:a05:600c:81c8:b0:49d:1f10:8b9f with SMTP id
 5b1f17b1804b1-49d1f109802mr74781425e9.7.1788991761946; Wed, 09 Sep 2026
 15:09:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <CAKwvOdmdFdW8=y+s5NLoNeKz4LVbmW8tr+JqJ26wqYFJDdARFQ@mail.gmail.com> <aqFptJRjLZIL-NX7@gremlin>
In-Reply-To: <aqFptJRjLZIL-NX7@gremlin>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 9 Sep 2026 15:09:10 -0700
X-Gm-Features: AcwNN1VBBOSItlzf2aBfQ1Tsn20Bkz1vl5nUIWxayca3KAiKBTvQ_pPLoFqBSq8
Message-ID: <CAKwvOdnMuwKxPB_SXDcwmrAiwZFXWUAgcS1TdAkW+bqhYEZ=ZQ@mail.gmail.com>
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
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

On Wed, Sep 9, 2026 at 7:17=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> On Tue, Sep 08, 2026 at 02:06:18PM -0700, Nick Desaulniers wrote:
> > It would be cool if your LLM could generate any visualizations of
> > what's going on during a build? Seeing what's serial vs parallelized
> > in perhaps useful. Particularly when you can compare the before vs
> > after.
>
> Great idea!
>
> I asked it to do exactly that, attached. Came out quite nice and sums it =
up
> nicely :)
>
> It also provided an ASCII version:

unreadable, but the pictures you attached are worth a thousand words.
Particularly exciting are the speed ups to the usual edit+compile+run
loop.

For the blue graph (the top one, first), any idea what that dip in the
middle is? That's always what annoyed me.
--=20
Thanks,
~Nick Desaulniers
