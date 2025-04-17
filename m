Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B78021516D
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 06:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872650; cv=none; b=Xv8jbwtvKKCMj7epKpSseLwfAgMD6S9ced6Shl0uEw52qvutucBcQebyh8fub4hkh2LRF0AmpqGUemcKDJKgIReE3V46KEkLK8LsqmxwxCd/ZVcNjAytpFgI82VB8n7Rc4eufnwMGqPE1gPzSznm+ZRDqJ6lPMy2BMEJYvBrEeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872650; c=relaxed/simple;
	bh=bPjPMZZeZS9G3i+WPgcWsNdB0nFuNYWj9ognqEq6Ixw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aJEPV+Oc0i+oPqJ5WLTfO7ayq2BXjlhNg5WSUHEdGD9kJ2FyNBOxE2JtHjL5/GgX+duaCehyLrQivSwDPSYi1B8P6cQ4oDDAirpP3EVu/TwjqbxCofED4MyRIO7t8AFa9nd9GvusRA8Ly/gWFcmW+IzbK+eeDRnud+/IIFxZ+pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=cWynsFDX; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="cWynsFDX"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e53a91756e5so386891276.1
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Apr 2025 23:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1744872647; x=1745477447; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rs0M3P6oIi+Elu8s3MYKXWE+m43BDKwint0NyeRoHW0=;
        b=cWynsFDXjK1xi96giHo8rVj+6rlvrXAphRctr25IljzQc+njQafEf+YPXHXgxj3mCg
         V7EBJVm7PZQX/l8aBb0vxSEO4CjA7nQVsYY6kmNE5p+jRdrsEHBLObkSbDc+dB2G10tI
         laJnKLw5u6+kixDcv+EaJRruIDppGm43bgL3PQ9A7ZspQt6KGSpHkzTsB2Zd0IS2rP3X
         RbH8BYcJvR2Uf0OcTcBvha+k5BetMDRQSFrwE9gERylES1ClDy0swYkTuQQBAMfgH5yd
         0Z2/VAmfuDQ4fjR6AYWIHybKRdJO080UqfOExsc4CUZ67ProNnRgIeih/nU7YaHl9yHw
         fvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744872647; x=1745477447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rs0M3P6oIi+Elu8s3MYKXWE+m43BDKwint0NyeRoHW0=;
        b=vTD10j4NA12VNgrOp88wvcXg7P9nHtVQk+9uI83C/SwLVH/eGqMxorZ0togOjGAqFG
         ZMcU28IrqCatE02FhQ/FZQqX1xuAuibYBFW0iypJVv2CBbTpPslNxhAi9JA1AcwX95Wt
         Edba9GuB2zuj43dXzPa+h5EWCSogwYz+HZIVwoRG+fXdVjoiz7kgCA76j8ADhfTeZ0Ta
         sLJEePgtYhu1bOlingjdNTnQeEPyr99cYYJHApdbWvNbpCGvOyQEVdFZytYuKVh2FiH3
         1AYGXDRhGmNJQChkJ05Co6/conDjqh0rujI3hwlut759cb3Ko5T3fBbzlW0tgfplorzj
         cIqg==
X-Forwarded-Encrypted: i=1; AJvYcCX5VT9eGD5D2LjgQlgOTM6L8QnZjaAiDM3lWjbf++cR1rOFIUNhrM7FIShSrEFK7aiZyXh2iDdFbmnCBWGTzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVmgGV7nmPNyvQ2+ombLfOf093mrBEV5o1VSpzpSInNmajd2pT
	/YGdRJL7JZc/yhyx7+q3i9rS1xRyoNunTBpB5AKZmKl+oxqBtCXC1sldgk4CWp7NWlH4bkRyn+/
	Nq8QyBQSpVxV3G5txHTUahTtIxf4FDWGQ4ZjDpA==
X-Gm-Gg: ASbGncvumjj+3288719PBNXuuvckXJvbDa2sY1hj8XxwqC1x8mtegfwnFFtWQVJHnVx
	hrpTbDjGDY4hlj+VN+NiM7+GrMkQ+hHGfZE33Y8meUe51TAwNmgRRkQTM62f5yRC16fnS+75KOp
	qiT/EkCGslCUWlhZ4fuiTv0Q==
X-Google-Smtp-Source: AGHT+IHOrQMgB8vPNp5Fecv62Hb3xWs4T5EZbTbfvscdpVT+/Zj4LX8xvv3X7FDShQp4HFXvzZvhweG2X9fqQl16ad8=
X-Received: by 2002:a05:6902:991:b0:e61:1339:31b with SMTP id
 3f1490d57ef6-e7275dec059mr6013055276.31.1744872646872; Wed, 16 Apr 2025
 23:50:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com> <20250325-rust-analyzer-host-v5-1-385e7f1e1e23@gmail.com>
In-Reply-To: <20250325-rust-analyzer-host-v5-1-385e7f1e1e23@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 17 Apr 2025 01:50:35 -0500
X-Gm-Features: ATxdqUEBa1ilwoJd-re6g56K23IrasyBGKA84QjB2U8ROdrzwewV-DC9EYbNqP0
Message-ID: <CALNs47t6+yX=rM78ggmC+og=-vnYrrcWHq507B9Tas-iRssaUw@mail.gmail.com>
Subject: Re: [PATCH v5 01/13] scripts: generate_rust_analyzer.py: add missing whitespace
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 3:06=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Add a space before the `/` operator for consistency with surrounding
> code and code formatting tools. Add a second newline between top-level
> items in accordance with PEP 8[1]:
>
> > Surround top-level function and class definitions with two blank
> lines.
>
> This change was made by a code formatting tool.
>
> Link: https://peps.python.org/pep-0008/ [1]
> Reviewed-by: Fiona Behrens <me@kloenk.dev>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Trevor Gross <tmgross@umich.edu>
