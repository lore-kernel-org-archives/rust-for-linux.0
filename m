Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCDE42D75E
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 11:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786449083; cv=pass; b=VzBSCatRf35P/rpHDma+cmJgMXq4TV8XSaDk+WrgpKujNez4MW5xgR70SpPlvlQRt43zv5rfI38K3D6SBSIL2DzBi1yXJVVh4ZYc9WmGu1w8+3sG4VsvxS9lkWptH4Kg5/iUV4uyGp5lRh3f5yHxASXNU7KU+2Uxi2eozslGoxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786449083; c=relaxed/simple;
	bh=bFjxCjs07lfRYmnHFFPvH53LSXJESH8vubxjvskON24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AQbW1vsF7E0qgnVSV4tt29buGCz+pwwf5cdBz0Ci+hzs4JUwuhlQ0fkVydXyaYB8K4kzFy86SHMM0422PvG5juHrgNA53/h1n+fDC3ucCXJvKU+CSooSQ7+hdSA3UeTySd2XAJTEgntpnTPUtQ29NHXNcv1Pv5b9c/5GUq8X/+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EU924Usj; arc=pass smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EU924Usj"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84a3323d858so209870b3a.3
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 04:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786449082; cv=none;
        d=google.com; s=arc-20260327;
        b=J8J1V+RcKQWhIcAd4Ashxfz+TWefrK4GvjNQVr55zfMbbifZn5LdduZp9ncgfaC+gm
         006X9EX2sDKiiq40T0dZfdZeewTS0B8zx7HKj0KTxakKbMeDOAVoeBbNUzX4mt6YFgtt
         K8SdW9FX879wA+ZuaPbkISZeLc1JuT60fKJTA4kfwvuBJOMr0qy9n96YVkY7ZZZBfwOM
         JDrjr+F/rvJvycC0QyC147Dpi9r3sT8JtAlThSipRnKUZ51bdacIWXFImDyKYq969s+u
         z8OPL7S3v+W3gx0T/+a5JaIg3HopNfV6QpjXm1+D+Domm03mU4b3AgLCwpdfPapdQ8Mn
         Z+9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bFjxCjs07lfRYmnHFFPvH53LSXJESH8vubxjvskON24=;
        fh=3NwElosCjHRmQe+zBRPnn5GiWkDF6PwBbpjGElmS0fU=;
        b=dsGRkchInywGwXMQaqzbyooZkS0DCzQ1+wcgsKexCAUKl/4hUZZO6GHZ0F3qClLhze
         n8imYRqBOhv9yA72jaDqBJj2V88BZX3CKeNmkjU99lrkG2dXq5dXVTlcheYLQZxLEWXV
         kgOt6PeRU5RbCYYi6t9CS4rom2BDjnB1ylJCABxEIb7yq+NrHD5QPfck5eIIa1ASLIAF
         c2Mr6tjwvduYBz+53WhCKAw1+ZG/qYiDqqPN51LAsHIWszU/c1IQkEYTH+qMrwvW734y
         GwOUPU6YV4aovTUG6MHvmp6+WCtREAdE14UB4h1qHQGDBSqYlpc2vb8In9bSNmNp8D1+
         1RxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786449082; x=1787053882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bFjxCjs07lfRYmnHFFPvH53LSXJESH8vubxjvskON24=;
        b=EU924UsjUN1c1fwdWfEoRbGFppjFhqa0sNIrIPFg6yInu+Gv62Q3lGdI6Bz2eKxaoo
         1lh5R96ac69eSFQl2dQZMCGGQ+Ck0xcrxZU/j1t0oVQeGqZBx6YJrmGpKTLpksQ3hagF
         BGErpGinxPleDSmT84tAZsjTtSQ9SLkr5ucbsH3418iI94LDeEmm4nYQArlZNLn1nI78
         PCh4bh9C2z0QzPLBQOFFgXOHTG7x06YpDNGsdCbVzvxjGLD4Vr1+W8ZZaXRzDWYKHkl+
         +kfEZoATAxODwBreTAsGuPPs7eAy4m2GNQcEXxRGVNe3qzGq1YIHOhy3OcteapC0eY0q
         w1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786449082; x=1787053882;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bFjxCjs07lfRYmnHFFPvH53LSXJESH8vubxjvskON24=;
        b=DBWQMH4yIMu0rkceNg2eo/vsV1M7AvknzOzkutfx8i85//lFCnhOeb9TRmyhS1bzwG
         KsnlXZ/KpTVEbUROm21nAJci8enX2fpKXVPigTaB3pOMoOjp9sU96RZVN177wjsomTMJ
         Yij8SpodqPhWVrDjoT4/A3uDL32AC+8ltsA43cPkKxtxx8/EaHH5JLd4sBk1S1RVuiSq
         aBHeL3UXg7maQrnNnuTMCGhEvZi6llZgyXrRlMYAYg4c7BJZQ8SLB7IDLTnfK6pwpKGx
         voyQ1uDt6+bE6lH/pn+7bj236ar2eMy5PVfL83wZE3FtVsR40LnogRojYGZmYujo3xc+
         5ttA==
X-Forwarded-Encrypted: i=1; AHgh+Rqm9K9DWsDHwwo/5MfGcl1wmMzlE6HQXgRC2ip9LS+b5tymEJzytwvdNKOIuXz5ic2a2LShIL6ojiVH7sfPFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhCulp0xzHl6JRrN6JR+KwEPq1+z+u9CXWdv3rVhG10Fk2HiC2
	6f0W5AlQnl7u1r5myRrlsmGaAZmQKk+dIVTnTUtnJgoX0H2/q5i5EtLWMU6utZTC4tQNIWwcoLd
	JOjj2k86p3jJX7GN31SVoyDuwSR3RK2c=
X-Gm-Gg: AR+sD11fHk0JDmGd4vFwihzgQiWa39JVKvQ6BMS+BfNYxMc1TUZThDzt7+8ckWxhnQU
	Om+t4AbUKslIVVlJK1KYikyEg5e86/KRix+JZjsD1jbecGI8EgZe4nadD2yRBxB8Z6NweDU6F/V
	aRnMeoN9BchRktzBvhPbMPM7KhrDaU6ysdcmuuK58PBb8kWEHkQgLSe3z+uLwwibm3BdeMSvrkr
	+4MPviIT7TVOF+e6NPlx9HFu7WHtLazWmqLQo0X9k03dGLtLT78r6YDzeOGXOlO5i8IVeZ8LzOY
	FDP/JsLUydwsvUpUPdvIIWTgb96xsJOa5+5Ql8i9mFk+asAPY8bsmbGyGxWrx6nC5j1OFp5AYOv
	dPdQ4kt/5SR+ghEZfxm06Yvq0zbMEF+yurXl40SPAfG8xuOfvv7rvh0R720VV
X-Received: by 2002:a17:90b:4c84:b0:383:5a16:bd67 with SMTP id
 98e67ed59e1d1-392ece92cfdmr1782713a91.4.1786449081776; Tue, 11 Aug 2026
 04:51:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808062839.1159990-1-tomo@flapping.org> <20260808062839.1159990-5-tomo@flapping.org>
 <CANiq72kHP1s7bGr4=xfJGR8KY=aUpjOB4OwLEG5E=TKULXg5Rg@mail.gmail.com> <20260811.204914.1779861669713390879.tomo@flapping.org>
In-Reply-To: <20260811.204914.1779861669713390879.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Aug 2026 13:51:09 +0200
X-Gm-Features: AUfX_mz_zHOZ5WD1zQ1zWsjmEP3pP3nRe5rUJXuKzR1HhVWhlZiKMGwTaVZ3V4c
Message-ID: <CANiq72nB_Cx6GvRAFd4j6p-6QhRvwAH2Ye5F2bgKU0xs1kj-KA@mail.gmail.com>
Subject: Re: [PATCH v6 4/7] rust: time: add Delta::to_jiffies_timeout() for
 timeout conversion
To: FUJITA Tomonori <tomo@flapping.org>
Cc: a.hindborg@kernel.org, aliceryhl@google.com, arve@android.com, 
	boqun@kernel.org, brauner@kernel.org, cmllamas@google.com, gary@garyguo.net, 
	gregkh@linuxfoundation.org, ojeda@kernel.org, tkjos@android.com, 
	acourbot@nvidia.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org, 
	jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, 
	tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 1:49=E2=80=AFPM FUJITA Tomonori <tomo@flapping.org>=
 wrote:
>
> You are right, thanks. I'll fix the saturation, the comment and the
> commit message in the next version.

Thanks!

By the way, please check the branch since I picked the earlier ones
already -- I didn't send the notifications yet.

Cheers,
Miguel
