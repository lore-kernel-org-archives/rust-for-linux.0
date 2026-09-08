Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E621583AB4
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 19:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788897579; cv=pass; b=hbg3je35MZCsi1Gw0sF3u+pLeB5vaqWCYpa5SO7CMQ0F9N1IyF2BlYwNzxjBOjQW1iaTRJ2mqzmYMimiimQFsWjkGwzDqqJspVKBSlmmVkIC32as8Qq0u8l0pp3Ija63/X1ZMior/ilgXWmywZI60LhI7s4T9uDloJOqYDDQ1s8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788897579; c=relaxed/simple;
	bh=DcQuradJJQuqIQy3eOyKV4Bhq3ZNEMuO/29imkKSf4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RW5uW4jce5SNXt76JfgcZSUqlcYEoYh2zG+RY3G7zgwfupYRKMebdnlxZgik4A0+ZisYZKhuhmlwVpOKCPBrIV41MeYIbuDVMDZ8c5INnIyoa/K4EdCeHvm5dHRxhMoQ+aOychdIZOxwrbie8ShXSbpzSrULVn3DkP/LRVsiBHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlgEv84c; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlgEv84c"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1b73f3fd6so101182a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 12:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788897578; cv=none;
        d=google.com; s=arc-20260327;
        b=YO3l8xk0sJbk0HqgqppnSz0dXE3ocRDgNWXtQWjcXkjAShfTj86HYftIXRut8gE4fN
         RbQat9zs4F/D4gn7XrpaultiWf6ZKj6Z4PtTJkZPVytMW/BLLpH9A5bW+jTz+qy/wbkP
         U8FkfuKEBpjJjTbtv/pc7VQnm/c8NH0sHN+LSKYv+a3Ry43pweUgTC3wsjXl+es7e/cY
         abZ9hXOXTbuTOUoPyfS2QW8Dmy6WWT6pndeZkK6DC3hoLGy8lYlRAjX9ZqYeFFYUCrCB
         St/uUW0SczrBA8c0erJKdQDXM/bf005GoeIgNi0BYSEoVJ2y8VflshQYv0rIA7z0JY8l
         aBOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EA6VJj3uj11HfKzs2Men39fPqqbTFVz4Jj43+Ofeu94=;
        fh=59QDJoG+Imz7NMFofXaku1D4zgj/2T9fVg0mveYZRas=;
        b=of95zbZ3fL56xb34/7oI+9WKwrsDusZMAU8tnjFUiSxcDUrs6Neh2m55HxFexBVjWM
         uOy+fZQXbfVe4pZsmVe/YkcsHWcM+0nHveN5JOJAt4Tz4nyr620yYt/pLlpwrOGhZ3rE
         QWnin3rkcAWXe+ytcT+IjFvN1hK8Znx1OPibqO9WTCkgNC1PYE9svkxvTEhSFYUN75Wp
         IWJRO9bpYEqN6r1ISUMweNsvoZ9mYUHXjpMJatd0WbEMnRhGVaPX0DmqTRLhz3GjqK/6
         irqBtH+xQGYwW9/Ll5Ahau87WQQgnvytq00CYqZcJ7OhnQcdemVslHEbQk7DG3/RzYex
         oNXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788897578; x=1789502378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EA6VJj3uj11HfKzs2Men39fPqqbTFVz4Jj43+Ofeu94=;
        b=HlgEv84cnVSRhvC0/JztMbYHq9CSBa0mKQMWXBlSlhA3EJMkaOm3Tz4wruFAUasvcZ
         k4xiN4GBphxkY5+JJ84NvaLy1D8GodwVoQj5ecN5YSqNm01ptf73Feu9/XMg2JITt6Ok
         4yI3XfdxwnLZyir68qni9KfUsuL8lK+maS0OmpNIJ1ocdbXP1f8VpzbaZGn43sfi48gW
         +N5g07QIp2rVlxsqTih/zUzIr7kTHAYAgfum9wCyZKNyTAMwRMoAtirD1EBNr1HYfC2V
         pMvBQQc62wdW/qr6A1LmluRdotAF3lOttMrGtPgRuXZsRWMD1IzqTwfhp147rqXbq45W
         ED3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788897578; x=1789502378;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EA6VJj3uj11HfKzs2Men39fPqqbTFVz4Jj43+Ofeu94=;
        b=pmFlx4g2WCvbRzWgXsQ9kFwGhC/OKLMhWb7JqICfp4jecz1NBjLRrYh5Th1TUsAZ0N
         jw5VsdGBcbrdVU3GIi/rApB/NJxtWzGjMj5t7y20TBaj+ZnRbf+P04xYBdvkI9/1ipzG
         DiQcmsMsLXwusxDXq8Hn9frSH9ISM2h7aRDvaZOqDDqiqnMm+9wiU1zzQ/oeD1o6+FqX
         IriS+Ff3RtA5XoTW5KlkhbLimXzeVyi8pkXKKbIToy+mvyUyRvWl8yNhhfcLbXbVOWLU
         4CeI07krcLdlWy2gkCh2akQWR8j/QDwRxFKg5mz2rtsBSkaFLKnj9/t01CRM9nFpGiI5
         ljdA==
X-Forwarded-Encrypted: i=1; AKwUvBz8UnCsYrpgNoW7aJkxo2IFnl+egLU4TY1QcM6oBdVzbqWBLbuX2Ybw5iIwant3m7AMcbo3iS009dU/AtPp7A==@vger.kernel.org
X-Gm-Message-State: AFuF++nZsdK2E7TDpoUS/kjQt9c1T7p6CDJrpF9wTZ2omkGtTLPGIyI1
	tNqFRjpCj2pT6JL/hE7giMk4zs6xscHedD8KXwp72wch1y+NVb9rCnnahDAWQG7RAxeijYSxrGi
	mDTw7pJgxmGhmEBPjhh3V5OHuTt0wHkA=
X-Gm-Gg: AYBFou3zeFUnpKmQN2fbhME+scoO6wkGLLWm5xitUrmZwacTqeQfMUCYbsdQlGd8Pn1
	FgwM8xe/LiUQo1DdyZLpPXqp/R0ZH6jBvxDP5xN1x3lEYCYe3tlaJ2UsCKH7eyRs/Dh6bWUaQE/
	aHYe2igkTCAl8MiUUNLmu1+cMj6ELwKUlDDVJXWMsc12+WZC87Hia3KHGaKP6D355b7HByEGjrP
	O9PyhH2WvFCjHT1Y5u14ATA2LakfF6pP1Csiy1740AzP8ER63/w3Glp9MNwccS6hl3eiFGK3uFf
	DGcDwMfkjn9kKyYcyz2F+QMZhMXSann8L19TTyn9tgqKYWcPMNZe/O8UjF8kjd/NfFfnPHNCtJB
	+E6ZcfgB6YFw9wRQT6HragUOXbTpZma/kBQYxOjk7GDhpGg2+fLcLD9K4K/Vg+2W8hJMmGKdf8t
	t0JXmNvpwCnYIiHYNNmt9kZE7uDS6ZcsL9lGJ0OXqf
X-Received: by 2002:a17:90b:1d83:b0:398:bad2:c10 with SMTP id
 98e67ed59e1d1-39b3d85c011mr21904473a91.6.1788897573126; Tue, 08 Sep 2026
 12:59:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908080604.34070-1-1239989762@qq.com> <20260908092624.63350-1-1239989762@qq.com>
 <tencent_DEBD9FED1CD8FC1625D8EBEFEEC3EE7A0405@qq.com>
In-Reply-To: <tencent_DEBD9FED1CD8FC1625D8EBEFEEC3EE7A0405@qq.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Sep 2026 21:59:19 +0200
X-Gm-Features: AcwNN1W1ixlmDUMcGjjuM4E8fj7zx1Mzofm53MZn3V50s9jujYSJ7LULEMxHfsA
Message-ID: <CANiq72nBueaioDwo5d6=mHWjjJSLO74EvK+28OMtKYH=XNh0UA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: make unsafe_precondition_assert! const compatible
To: JX <1239989762@qq.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 11:26=E2=80=AFAM JX <1239989762@qq.com> wrote:
>
> Signed-off-by: JX <1239989762@qq.com>

Thanks for the patch!

The kernel requires a "known identity" for the Signed-off-by -- please see:

  https://docs.kernel.org/process/submitting-patches.html#sign-your-work-th=
e-developer-s-certificate-of-origin

(The thread in lore.kernel.org shows unknown messages and v1's cover
letter was separate -- I would suggest sending the patches with
`git-send-email` or `b4` and using a new thread for each version -- I
hope that helps!).

Cheers,
Miguel
