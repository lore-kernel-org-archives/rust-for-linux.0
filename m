Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C303D37475B
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 12:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266550; cv=pass; b=OqTwe/w5BFA5pdnkPDfBz7eKzxr2MLVk2rt3gIntEJaAO9ogmcMmFjYmUDIGu6tsETZ+efXO13RTRkfktsfG5yAMBDllpMNVHb/bFYPh8J1nFRzMJNpifAf1gncxwuzDlK3oksw/OMaB0em5oXYMPd7nMkp4OEzl1ybH1S4H74o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266550; c=relaxed/simple;
	bh=ZreO0EubD/Cpg2PFlTmnjBPWguJk/VPiiKkxH3gIp4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QDwH+R9yCcMjhpIg9Wy6WKLz/6WkMDXL+9+SkrVjt/m3tDW8kBjpYkG9UT8d4n5Uguk19SyzDcfMquMDcjsgMWr2yAjIfPFZU1V6pw6AWrS2BN6X0r8I3R8UDHvbDupUQWnu2eVe6au/sCK7Vhr0jOM2fAddSQ6UQnO26FHst3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WP8yHs1Z; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WP8yHs1Z"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d6f9d13f50so2600635ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Sep 2026 05:42:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788266548; cv=none;
        d=google.com; s=arc-20260327;
        b=p1SpT1B+xWU6i7Jl+4oc5jJPopu8j6CIOBd8V5pB0j7ItQUNkWR9mfdQB8nN5Ha/iZ
         zmauRZ/cmRUUZiLpPLKm3izU/p8aN0VQagpl+Jqw66tUObsT0J5olHFRU6uNv4Kigg3k
         xqT24uxnYiJ6Ds3mp50sJZSfC8JAwzHa6Gzup+NWY+mjaW8WK9RoEaBOF5grPzotITQK
         xIwAqM1peuWVEqw/TFJ0fX3ubHBov7TvFBFaipWv/i2v4x+lAATg90ySQeqkmTEw9Svg
         GvhYXC7rRuQ3dkhXX8HgjHuzafaruSDDfXDCVzRqlSagT6/XJ5cMnPOHDI6Oe3NYiSPI
         qghQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZreO0EubD/Cpg2PFlTmnjBPWguJk/VPiiKkxH3gIp4M=;
        fh=S31fsCv90aElFm7/m4YP1p8xUgHoodWUjVnqwV/dDLg=;
        b=miCHXdiwah70baiTuHx0igHkx0Iw71NAo90a8n1yNVBs/oPv39T8oKH06mGka7Qfqf
         wlTGfDKORkmottOiMtumoD0PfA4GtyEz0bKGxn8DYHFGmECm8lEdIEiln81dbhO6Spys
         WAHXi8iZZ/tglk202/A3c8QrEIDXD3hhNmHMJctcnp+cEuKZc9vUL3CSZC+bnmEs9o21
         zDGMz3DutfSKTfYzYqp0sCMWE/SNoN0JVRoQ6m7+/1otmvJFsDZQRAns6ggM4oogFfdD
         D4dYlwmyb9ofkM6b+yOYcVrA/4QZTCWGf0sxlPvARGBY+WJB3hvCfWSubYSayCNU83Pb
         xWCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788266548; x=1788871348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZreO0EubD/Cpg2PFlTmnjBPWguJk/VPiiKkxH3gIp4M=;
        b=WP8yHs1ZJ6F3DqOFSZF7f5mLDLSaOZgOXE1egF2FqkzaHXQWbk0x5q2SYHqCjQ53c4
         sZfNN7Iq9M2UDDG94HJCHH22rF9OBz0U4PC13mEp9EBtu/VsDvq5t6jS4AW0Za4wn1N8
         PoafNmo+faCsCuTFMQlzyJI9uOC25vedAPHEXNM6bjXI380dDGMlFTxZkTj1H3Kh5p+s
         SiWYDT7q8gv2thXxpbcD89oA5ZC0fE3cTflvR90/MgxpUfgf0C82053cZGzrdl/0+zqm
         s1N5qxTYTptMCUI8n+dQTnV5pY7l+mObYIVlCwa+nXENPuA9N5cGeT3+eMAle0dBzwnr
         eBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266548; x=1788871348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZreO0EubD/Cpg2PFlTmnjBPWguJk/VPiiKkxH3gIp4M=;
        b=gvYffPl9MAMyaBXqastBd1VHl6mE1MjnwpSGalqP7inFta2mTttb6M203hMKmIUl/2
         DG6biOfct0pvqnxfINRFI1ivxLUu+TejMIf9mjcvXwD7kmSqcMX1AY1LbaSrbz6HNxjH
         p/VjtftH+qeG953NLP7WCS7esQ6OhhHa/DHY3LqfGrZupQykgXbRihJpaLHrppcmzUWm
         QY7lZePwfNlYZIymxBnwOL5d6KAIShYjDhnF26SuIiesPMM7FC7lMXpJWgtfGngo3Z5v
         1bzIchyutE/1lQNKCJcw/6Wdb0jqYqiAw1kWL/oJnv2kFLLMG43XMEhsMyxb8VwzP85P
         2dgA==
X-Forwarded-Encrypted: i=1; AKwUvBxgXxHoZ2Hf1d10Y36UF1LxaPqX1jRK/rUdqsoN+sSKQcSyQ8tHrI4cGUUTGuojwbrUDL1J7MQehA1YQcfoRA==@vger.kernel.org
X-Gm-Message-State: AFuF++kIwF7u5TRJOQ6tjaxSDerpX7a8NUmrfEmJo/UWVyJKUzI3uBMP
	NCzH52dIjmjNAPsr1kKb8Xw1PL0BG2+DjKEiHjBSXZ1LwLgWB8SYki08JwSGFbnigwdsL1ZE6vY
	xYhbnQZUjM97hwfIPWXdPy8a/lbVv4b8=
X-Gm-Gg: AYBFou3CB4Nh9SHf2t2D5U9kyjuNPY7U6IDnx/hI4z9336tvbAZi1tR3N54X/rK3aFZ
	8o1wtI8ObotUbc8yAEXeASTl7mDrgYAxdSxE6pCYJCtQBCI03mHItAciTZPSs0aXvctVKJGv9OX
	BZ3SADl0LTbbnxnZzlUkOfotHj0d4IYwzFTGCQz+8ZYaJFLyuUZUW/hvZUqQBMvwvMy0Wc8C+pz
	SmPXNAM4n7Mv48Yq+LLRfkYrdHI02T2JPw2ArR+NPVdUWpXiSNhjS9KDai7HPG7KIRi0bhbtdQV
	m/DzAggM10+v/gLmQR9X2adIlCfYeZha7vP+c7TR/LdJ1Or0tD9Ynt/9C84CjukQfUxlfM7CwaI
	96vCSghFn0KVxZWnxJ+O5XwUxmMphKcf3XfBqf9P69zrGa//7i/0fvVUEk71K
X-Received: by 2002:a17:902:d2d0:b0:2c7:ef84:c58e with SMTP id
 d9443c01a7336-2d74dc08a13mr304207985ad.1.1788266547835; Tue, 01 Sep 2026
 05:42:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-fix-pci-irq-vector-index-truncation-v4-1-f94aa6932fd9@hotmail.com>
 <DL3XDBBHXKKV.G9P6KRSSX1DN@nvidia.com>
In-Reply-To: <DL3XDBBHXKKV.G9P6KRSSX1DN@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 14:42:14 +0200
X-Gm-Features: AcwNN1VnWRWOYROIxu4T-i2jI1d1fjW-RoGFUjjuLdYxZ3xRyTDBVBEFMSpQ8Bo
Message-ID: <CANiq72=GvH3KwsdTMtRq8jJcTWAh83uj5L3qD8vHbyntgCgoNg@mail.gmail.com>
Subject: Re: [PATCH v4] rust: pci: reject IRQ vector indices that do not fit
 in u32
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Sophon Zhang via B4 Relay <devnull+aiqubits.hotmail.com@kernel.org>, aiqubits@hotmail.com, 
	Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, linux-pci@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 12:58=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> That makes me wonder, shouldn't we make `index` take a `u32` directly?
> If that's what the C API expects, it does make sense to align to it
> instead of forcing users to make a potential unneeded conversion if they
> already have a u32.

In general, Rust users shouldn't be dealing with C APIs, so if they
have a `u32` then it usually is because we exposed it from somewhere
else (e.g. we returned it to them) or because that is generally the
right underlying type, in which case it may make sense to align
everything.

But even in those cases, it may have made sense to define a Rust
newtype or similar instead.

So other than exceptional cases, the types that C APIs use shouldn't
drive the decisions on the Rust signatures, since they shouldn't be
seen by the Rust users to begin with.

That definitely introduces some friction on our side, but it does give
us a lot of freedom defining APIs the best way we can, which is a
major advantage, i.e. since we have to provide these abstractions, it
is a good time to be able to clean old decisions and improve on them
using whatever tools Rust give us.

Otherwise, one could also argue we should be passing the underlying
types in general, e.g. even pointers.

(Of course, you know this, I am just elaborating; and obviously there
may be cases it may make sense to just use the underlying type since
it is something that has never changed or is fixed due to some
"standard" etc.).

Cheers,
Miguel
