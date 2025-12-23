Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CD01373
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 06:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766469819; cv=none; b=FPWKD/n/a/Bfk94PVooX4VItJD9wUhM4WAV5YQ2jAzzUQ1ZRUqpIHEyAkeNX1O2EJAI94v9lfDDQCcxBDxt6qCx3vQ7QcNSp8zBT+LLCXU8r32ImDbuDs0gmdve9Tyi3T2pH3f/M6+jBhKyCkmuek4I9n1RBJliNXan9OLUO3sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766469819; c=relaxed/simple;
	bh=BgHCoPoz8J/q5aruPZwS8LTeVtKERUmAkq+DjEMTs0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bPicswRC/LClR7c3wmetN0hrBnJ2YWbPc5OgxBgc9snfs8Mgzk9/FpKeeoDOfXm79sqpl61iewnBSbWMbiq8nTXJOwfLqIA8L9f7WQOReMBFPDtuR7Dh6Z94bZdhdelexirb1MJ+y5BQbEJxxDefBp6QYHChKrhLwFVzircyEtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ho/lUM7l; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ho/lUM7l"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64daeb28c56so515962a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 22:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766469816; x=1767074616; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S52QjNysxMLVIvAOTWkKToe0v7EFFUZIoXTdvBPtlbw=;
        b=ho/lUM7l66zaHjcBLDzlH2Z+QScnZ2yDUsPGOswzYT2sN2PWxtBrc0QSvNMcXYVAlH
         /T/OT6ZXNy5KFdZLxpUmWnsTIGGcqe/JXFYPkQ6Ip2zpAoqA1M/Ov+dH7idY4AKj+1zn
         ykxpfzJeL6OgsV+SmddCGcKDF4QCYPclegWgw/iFe2E7hd/VJypRdGVJ6zQO0dSIZbyl
         Vr312JoZVpBWN3IP9tC2ZMx9MvfPjX0skt9L7OoHT1DFkb2Z+orau9+TwxChUiFtAXZF
         TwqnWpA3LafJ62I0lfb4pPEwENJijR/YsjDz4o2R908dUUgoPZEPkkyxlwza1IBowX80
         X/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766469816; x=1767074616;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S52QjNysxMLVIvAOTWkKToe0v7EFFUZIoXTdvBPtlbw=;
        b=ZTb5vnRGgk2CTbxl0SyHY6wVbj6ixlMTRp+8bfT1MNH7cnMhzW48fq/rBWWEfNtQMu
         U1iMnb+A+DgQXYDyf6kPuzVAdEvAr9rTicMryJx4F0L32bioXsyPw7rCdyWnxZS5dJtW
         maz5Ea2BNvbIUK2SWt5E2fqPQvv6koJ7RTrOfxWA17AEBX3fDpKkogBYhSVa1IC7ZYUZ
         uKU+o4wkYhZiuSclMcLAluSUiM8W5QqachO40cz35kFzdpFTJGJIK/NAome1+RB+oAsC
         mFz6y6/7OU5D/6Jo6GYqynBQ3NrEp+5N9PCvS8l+l8AN5ej+ie+utS+WA7sx1k6s/WOE
         pKtg==
X-Forwarded-Encrypted: i=1; AJvYcCVu8UJTRbR6y6Et+QuDrUeKhs2p+YbvpC4n0nO0MvUhdqGZEMbpOlAJMisSgqHq13WWM/CodydNe+mSak28kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHYX2h+FEkAbTmYRuEbIZbzwFJlSVH9QEmfsoFdhBVIrkQhXEU
	12HZdF4x1M1kgU2b3oFAtXptsLY7jKLfux5CW9h0926y/fmexM0H8JVmEgQkz/p84du4/kNMq8R
	U4i/BlqnxLrNu33AunNYZ2JYPzg0Ic4U=
X-Gm-Gg: AY/fxX6zVtGUH6rmryMzSlrBrzLG5JB+b1NXNwpo40qu7hhPSUVxq0I9jyb+GZ9eXax
	I0eOK0RZxGh12eNTXUXvFoebsCNo3wnQTZWqdjgzj4u5yWFS6tZyquO7oXskyBqP2zk9w+gq088
	gQKMzPwWk5pXvbrC6DvXq9q6XisB3GS7jTwURYJPUdDQBCQJ91oC6rlN+m9pCwdr+8cBSPL47xM
	ZKyp+6npaeLpEhE9puEdPu+KyaVW1zeHTTf6xCPTA8CJvs69r2IvIzJ6dd1cA30ciuw8x4=
X-Google-Smtp-Source: AGHT+IEqItO/dFmIWJ/UuthC1HeAwvF1iEQDq3Ii1MPL0hYlnvPY3tlnagtsR28Hvv8PW1qqMT49DryZQ06hdq1jfW4=
X-Received: by 2002:a05:6402:2553:b0:643:1659:758a with SMTP id
 4fb4d7f45d1cf-64b8eb7295bmr12544499a12.28.1766469815755; Mon, 22 Dec 2025
 22:03:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251204024336.246587-1-nakamura.shuta@gmail.com> <aUGbJ7IiFd1T9QZr@yury>
In-Reply-To: <aUGbJ7IiFd1T9QZr@yury>
From: syuta <nakamura.shuta@gmail.com>
Date: Tue, 23 Dec 2025 15:03:24 +0900
X-Gm-Features: AQt7F2pJer7NYiU0xl2TS3iv51_jjXjTkEc5OibPgU9zCFd47OTziWDZmPowu5Q
Message-ID: <CADLdC+f9wT+Wf0p3vv5sR8rvx=UV3kH6O2XjnDjJu7c6=GuXqA@mail.gmail.com>
Subject: Re: [PATCH] rust: num: fix typos in Bounded documentation
To: Yury Norov <yury.norov@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

 > This prints the same link twice... Does that worth it?

  Good point. Closes alone was enough here. I'll keep this in
  mind for future patches. Thanks!
