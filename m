Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420149;
	b=f+up/gke454JwIh07guH2k0GU/Zhn9Nfe2PuNLYaSOLpizzKVzNzOog2ThB/08iKDgX4
	 /wbh7ZKkF1FRtylYfa2Ly7EnT8+ZCXlhMlDakqFAAakkd9O2k7zAAvimEGmcAWTLn16rA
	 B9aZXbqN7Bhi7yQhc93+7+/DcNu4pwBdPT2/xCjkiYpi4t25zjD8fWdvEAmSTKcsNL+Dx
	 muKzhZCmUfKvC5gr42E5Sv3wcn8vK2U/7IL5bEEphL8pNMJmhYOqSyuRxGO+xEWerrenA
	 BALgPOQhj3faL5uj2CuDqtlgXDbc2otmsGjsau+OQovz4eBYx3ujRLt8CRn4HVLKKJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=0VI9Q9XwR6bRQQ3TmPGC+I/U5U5l6R6iT0XGNgq+fEg=;
	b=Dh1IEIdUvppZKiSOxNRSkx8LZBoKYUvc9pm2iTC5nKqBmbR9oDVAQsUauX7ltHR6pSXL
	 U0cgBEt9dnH4n0bL2TAgjeMeicS9YdmjqlvMZy3QC+yRl6NIb+/gpTmboo+BPd5yY3kwx
	 oHhkTP1eltPcZI4GQ00tuxonYNKn/Zt8EDLrzZGB8A7WeX+2PLSvXtQViYZ+0jp0HzKMO
	 7WpUyfAKDajOHzdg9nA/KC6IuDs6vqi8m1um+XUvQe2cQZpHRW3PWQucGBMHxiO6aCcUG
	 gRSSxtII+k6c/220YwGrGu3b6CbTZDuDtjMcAPRjoTT3qhXCcSwpJCKBi1K35sjgp/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iSoenNmD;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41526606A31C
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Nov 2026 18:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41526606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iSoenNmD
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3acec6677so5196477c88.1
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Nov 2026 10:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794420148; x=1795024948; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0VI9Q9XwR6bRQQ3TmPGC+I/U5U5l6R6iT0XGNgq+fEg=;
        b=iSoenNmDmGqQhZCap/1hcWU68vPL1YfuuxAhLX+EiXFHjq1WaY74+zdrs2T1+U6vSl
         5k613qHh70yMioRxiz+O7VbrIpJ8RXnc5ymgAUi7rnkgAqElYU7mWvPEQlH2B50tMusK
         hwI0mgQ567CVccFJIwMS1nP8xbDFPudEwLdLuQskC7m9rbd+97iaw8gK50lic1E3Gv+j
         KqQ5YNyyPUFkSlfPN5njhN+2R5rTyauk+HVwGfZ4eEB7MQlCqqOQe9M7JYTKy1VwtR/K
         1IsuN8EwXHRuJKbm2eS2i6ZoQvOGYBqiYH2P7OqLi9dv+EcJcM4UTbgxc/QL30+SHQqX
         9kRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420148; x=1795024948;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0VI9Q9XwR6bRQQ3TmPGC+I/U5U5l6R6iT0XGNgq+fEg=;
        b=YQyTD4kUwp1W9zh/qIWZOjpva5E+ynvdqj4k/ELvzbsYBJDNYNHQVJXDXI/uqBXIZo
         M2FaoeJHc/vGsCqYwvxfqaZjf5Seeei6F7trcxnUxYcUImTia+km+lNW0d9nzLNENAVt
         TnCNzA6bGTG4FLx+KYwTpuLu4efALz+y3Z/0f8TWLq84GUlpX5g19T9IviHAy04jPZO/
         4m4BZJzhOMDiT0veLwj5fzgOcEknx+/j8dVPaBT4o2/+hPQOlg2f9vQTb0DImBCchYSz
         8knYFEUjVDJCF5o14Tm65O6RuG+2uqM1v1+uMSTZEvHSfFH8oqSF+0U+em1kbopYdQc0
         QOFg==
X-Forwarded-Encrypted: i=1; AL+hErFzkxkmcB09YfmXnesfaQ59QKySo69po1t6E/wfA5JqXkPgA0/0/uvtxnQTTSezb+oJs1McVhPJOiaYtTuKFg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+bDhaimaVeVH98nX0v3GPXjqz7D6VDiG/PgrvpJvXy3KUaDy0n
	4BCkxcJbJ3NPuqVL4qEs2zCiaacBNVXQ5lSz7upK846mHyf3vXMQfFY=
X-Gm-Gg: AYBFou00+zB8mjPW7ErLxgg/kQqo68Ls+1+Jrrx12TgTJjYor3pb1N5Y8x0UmwUumo0
	HUXG88kr7lKvUtNW+8XPNKMuaRHzVPBFPnoEDWtP2nFt+uhm5usvr0o9eXaO0EJztLf4IwOwmYM
	QEzuS4zjAXUc2QElHb+6n1uqIObif3lUTwuq0MFLNy/sCoTmST+iqLuIF5abk0BDulb11GVs6FI
	i7JNnG6wtwCQgSwtIyIS9swGtuOglgQM2BMgKWuvr40Y8gb0NCwvZ9SjhLlGxFhGG+++ZSmeCFG
	lUTWeTj4+fVP8qqaFmwQkfGSaxfeCyAeC6HRHD4X0CkcGzpxEIRc8UomCwtxWSN5WlyoTe+9j1A
	B+zsDb5nTr28K4vNT/n20hd4RvjkFGLQIIB+/ZlDn1dZF7RpL56EUnk9ESfMgx72o8v3eAsaAyM
	+xAMLN9LzrIuCtFo2kPE/GlBp14XqGQU9T0EkALPUpFddMHgWSLCKqVgtYg7QVxhWWORTEBbiPq
	QaXJRjP+lxZ0sxSSTkQ5VYkFfVQbUkVaw/tGpWxX0ct0ua1ndvGzU7X442LCNU2C5L6kSXWEFN7
	wBMiUehfO9mpljVWIM7LDFhxUcq284/fiVQ9d1eZt5oWZf0lM6QNQ8aNahY5Vd5N
X-Received: by 2002:a05:7022:285:20b0:143:8860:afa1 with SMTP id a92af1059eb24-1b3c036c2cbmr3022368c88.46.1794420148123;
        Wed, 11 Nov 2026 10:02:28 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm15933313c88.14.2026.11.11.10.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 10:02:27 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 15:02:22 -0300
Message-Id: <DMSKUP6NN0CR.1ZO7OE4LUUFYN@gmail.com>
Subject: Re: [PATCH 1/1] rust: i2c: fix adapter refcounting during
 unregistration
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Igor Korotin" <igor.korotin@linux.dev>, "Priya Bala Govindasamy"
 <pgovind2@uci.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>
Cc: "Andi Shyti" <andi.shyti@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 <rust-for-linux@vger.kernel.org>, "Ardalan Amiri Sani" <ardalan@uci.edu>,
 "Zhiyun Qian" <zhiyunq@cs.ucr.edu>, "Dylan Zueck" <dzueck@uci.edu>
X-Mailer: aerc 0.20.0
References: <8ee79da8af6557be8ea9cc2ecc74bdb6e4013513.1793488795.git.pgovind2@uci.edu> <179440960895.2149.15642463251380257016@linux.dev>
In-Reply-To: <179440960895.2149.15642463251380257016@linux.dev>

Hello!
On Wed Nov 11, 2026 at 12:06 PM -03, Igor Korotin wrote:
> Hi Priya, Nicol=C3=A1s,
>
> Priya, nice catch, and a solid PoC.
>
> Nicol=C3=A1s -- this steps on your inc_ref patch from September (still
> waiting on Andi). Same function, same root problem really.
>
> I prefer Priya's version. No new C export, no Ack needed from anyone,
> just __module_get()/get_device() directly on the pointer we already
> know is valid -- and it kills your locking concern too as a side
> effect.
>
> Didn't want this to land without you seeing it first. Shout if you
> disagree.

Yes, I think this version is better too. In fact the solution is the
same as the v1 I sent a while back [1] (but Sashiko caught the
CONFIG_MODULE_UNLOAD config problem). My idea was to send that version
fixed (would ended up the same as Priya's patch) but there was a
discussion about adding the C API [2].

Go with this patch, no problem on that!

Best Regards,
Nicol=C3=A1s

[1] https://lore.kernel.org/all/20260615201141.8920-1-nico.antinori.7@gmail=
.com/T/#u
[2] https://lore.kernel.org/all/DJBDWVUWH3OT.1GDEIJT0R4UTK@garyguo.net/

