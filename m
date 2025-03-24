Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C158912E1CD
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Mar 2025 19:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742843909; cv=none; b=bdLcR1n74ny+7/MsXhJsq3HWg3vpNt84GEg1Nrhd5CIHYMVNfeRt9wH68miZjd2wrvWFWvfeMrJvcAXIctTrF6qYgxQX5SJdU08Gc5zSNucapJX+wm7LBOo4Sa4SgjnAC55wHgwW/D/e/+lhBgythUcT1QUmip8eqcYyRnURbVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742843909; c=relaxed/simple;
	bh=hkGvkHKspLHWEWd4PnFBSgnnydynMu8B817O/WXBL5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oGAerbvLpKTdHzL4x3GVAUr80XRy2LG0rozYLMuAgOQq30/PFxI3VwVY3lS/8K2ZMukKgQJX22BBdC4lXX3semBXVNS5LhNaxU17Qyc4ZESdwQ/304E7BiXwADcn5s5xeuDu3JEPkoCA9Qr43qFlDTDBysRB5qMf5MnxYj/pjpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbklQkSn; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbklQkSn"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30363975406so185421a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Mar 2025 12:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742843907; x=1743448707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkGvkHKspLHWEWd4PnFBSgnnydynMu8B817O/WXBL5c=;
        b=XbklQkSnagnUv+GdiPy0SO4cMyEjyS0d1uOgdqJKGumbYDg+Xl+RkHKz3vdLgnue4h
         yWerSpEawl4Q4rOA/VRjNRqfybZBWkIUn66w6pp6EyLAiDqyxMLVqgAFylkUai7VoerU
         x/j5bjH8EvZycCLDwfm9lqos8lbxsvERutZhz8AtKh6GXztmLjp+Vw11rzEMc2LK16IM
         441PJl2I9ON0qUoOBw5Zf4iRzCSn9MMhyNg7NkYRZ/feQTLkLbDItKxpNjlPaTK/CX1e
         bzvbhMfZwJd9Ucez7v4ZYklo07bMcziXmU8WBtb0J5VjkqVgEVczLGkAVgoR6rcSjRCu
         lrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742843907; x=1743448707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkGvkHKspLHWEWd4PnFBSgnnydynMu8B817O/WXBL5c=;
        b=LOwi+PSpzxR8ib912lOb4fm/oNvkBgQNxCNKGsBj24A9q+rlkL0lFMC382HlMK0mEs
         x2a+sdnXbswr14iV5AaFYheqGDt+QvYBFj/nZCq2TAvMJzAHzYvokTrJLfXkOFuBzU3U
         qo+2YNKBr3xASgkRm24vVNGlJgPaTzBoIjiRYvlK+0YKmPeGX2h+Sk4rX3hBjh0A4ug4
         nwC4nC0MJbkBbukDYKjMjk0H40L/WL0XEboYGm18/Cw0dKNN30Tx6FziLZR80i44dn8A
         v2m4+3httxVvZ0743xTfiZoUL8VMNMu6nBuxLGOEo/kIAalwRihWBBbq89ym231Nd69R
         Gk4g==
X-Forwarded-Encrypted: i=1; AJvYcCVSwWNLupiIMhjmY6A++QFra+0G3gqMC3F+9ETu5+0pqOC6pUW56L/dt2RnY/J+2BCfOqDJlsh0FCvpw4wMog==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRMC/+o1mTbUmBsPPSsRQfoAq6f6iO+kl2MJIFUIAiDWOdgXSp
	PP/EHODi876QbR036BsIFQX7ctbEfcWHqgRiSnIIlqCZ2g14BmSLOumfst3nrWxulVRXF3QgrfT
	80HElEERtOYbkxdzd9mb+FfLSSbah5QMP
X-Gm-Gg: ASbGncsVS+Zdi4KINLBoDZ99bCTRBDjxnKB0U1ls8cjlGvPnq6+IaSnf+bDjbZwcuq1
	6YXM1j2F8yA8QWZr10KrHCmNpEEL3RUPAjAy3N7jpOPnYleDZWo4gBwqF6cNZumgSKF+OYvYLTS
	N5cRZMmEs0OwGoy3r4i9IWdx5Cfg==
X-Google-Smtp-Source: AGHT+IFM99Indp6/4M2yiZIg0dUhARUFOygcppbhWE357UrH3r/QLztLqnJsjlvR+UDGUvj7xhtUKYp4a32SXWa55MM=
X-Received: by 2002:a05:6a20:a11b:b0:1f3:3c06:f13c with SMTP id
 adf61e73a8af0-1fe844f62e9mr90871637.8.1742843906713; Mon, 24 Mar 2025
 12:18:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250308044506.14458-1-fujita.tomonori@gmail.com>
In-Reply-To: <20250308044506.14458-1-fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Mar 2025 20:18:13 +0100
X-Gm-Features: AQ5f1JrFi42EARfA7QL4lkwxF4a5IFBf5VckBWwyUwujfUJGhrLQcIpjArEBvvU
Message-ID: <CANiq72=LEma8DEgpy-z6hCK_xv2Vk91MLbGGC5=votDAVP-3mg@mail.gmail.com>
Subject: Re: [PATCH v1] rust: module: place cleanup_module() in .exit.text section
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, rust-for-linux@vger.kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 8, 2025 at 5:45=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Place cleanup_module() in .exit.text section. Currently,
> cleanup_module() is likely placed in the .text section. It's
> inconsistent with the layout of C modules, where cleanup_module() is
> placed in .exit.text.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

I think this is OK -- it is only under `MODULE`, and `__exit` is OK to
place in other functions (`module_cleanup` gets it by copy).

To be extra careful, I will pick it early in the next cycle, unless
someone sees something wrong with it.

Cheers,
Miguel
