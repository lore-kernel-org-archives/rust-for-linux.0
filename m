Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BC61F12EF
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 09:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315333; cv=none; b=bhztfFi4/jpjzSDwoLlIp4sxYWbTV9t1HoFy0PZKtiiZSsgqvzi7Cfq0XLtvJl+qZdZjL5sKMBbEJVGtc8SOYX6OqLlTw2C1JrmayncqdxVrdKVEMhKWF8X/6Q6uKBTsabnjK9UOLmkjAlJVsk8rQrJD8xKbSxvQuUWG2wuh85U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315333; c=relaxed/simple;
	bh=WVQDv1v4dOOQG6+a+SR4K8DVpKda75Ekqgvdi556yzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gYBMJUQ6EHTQj4pjjXC5r5/2Pncryy+Teas39TIW9n4BgbZgwlckynkuEphICyVv0NXeqcZ2SSTdxQLTxmQbSZ2NrK9Hm8ABzyvetf2RFCA2cMU+n4v0CfwhnuBJok7SskyK9hGWYuDNLjnOPZc/JdFT8onZqx1Snq8ctzowyZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LAQdd6ia; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LAQdd6ia"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso41522935e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 02:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745315330; x=1745920130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVQDv1v4dOOQG6+a+SR4K8DVpKda75Ekqgvdi556yzM=;
        b=LAQdd6iauLwtGptgU3EaXluyARpqNNwEx0oriBBfFPUMlx+FETr1u9iUGn0FyvSRu0
         7a7nVV52rLycwCipIfCy3TjnJGjxdWmr9BJrHdNTRuR7slyRVTb6lV2lu0qGkWqaC4ut
         Kq5yamyH9LhgzSnZVd3VedBFQ1IWImF5HH6/a8suBiPqtOkz0LbcSzUmDjouzPw5VeiI
         /z5Mu2XLOzHwDtaf91fiyQdjgon6xj5Y29VIDy6vhg57Gv8xWGYkEukhTkj6l7p1VLfU
         sJtXvLwQceKsDlKB71W+sO1b5ybu+41b4VzC+HQ5oJvEk9UgsmpUxXuXvT6OXfS4vweA
         HWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745315330; x=1745920130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVQDv1v4dOOQG6+a+SR4K8DVpKda75Ekqgvdi556yzM=;
        b=NTNxJpeRJupwk3zCmyVA1UL8CRecOwlH8dVnX654sadof7fBiDle6nTi96FGTPv8pV
         jHlplEaXzFOu4XYkvaNWzpg0nwTFdMuyyuvRp7bx0lxi7DVN0b51vZsSddfUK/CiesUb
         inMlhOR+SXb32+DHunjDob6F6LqlL5esdkxP7DZ63kJtX9sPH1D0IDSZ57+WZwn9JX/6
         mKNUFwNjlWiIpIWDznqT+64sRa8BuQdjJS3055VBL1lZn85MSXwmi2xRWWoHXZLf20NY
         9nx/C8w07c8Z3/6L+x8sx7Br8igaZ/jSABVc0eaGfF0fPDsVZ6rbLKGyxKme1m0+dQ3o
         cQ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXn3tB/zz0uTmayNWEETgmtGldsIcVUxP1LhB8o4Zhs3btM++2W4/+RtuaSmtwWu1JgTm1NDJGlis8jRZXd0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJn6I2rDs8pkE1AmJgRA++JDGNmt7t0LRAJgC6PkVRCpv9tcZq
	7oXcheAp1DY3/WY4LjWcAIsUM5vAXehCe6uqZLfepogzqRCg3IjEZLp18FlQM4h/hHXnfQcfu+t
	kRmuvQ3IpPuE7oLFZfnqCcvTzBZyPQU0rvlAm
X-Gm-Gg: ASbGncvj3rTgud2MxbkF9ChiWqBvP3YwfNoF149qPRigkBkwPlmtY1Xk/GSHrNOXGAc
	3/MLIWQAdc0JFXPZ7eHHTZ0W6vO2+vbnqLWP65+P7E6+CJNR6GKgHB0Pc0iw6E4qknANzof8W9G
	PgApE7cbUY4zM+BjWQsJa+Y/zm4NVji4N+Be28O+ZWAbh+eqXNcGYI
X-Google-Smtp-Source: AGHT+IEgzaZFAKrzkmmSeUf1lXEalL9tzKY7I1llBJA0Efnayt0Uc3PwpU5QMYlM6qieyM/pL0GWbg3KPU1y1RnS3Ro=
X-Received: by 2002:a05:600c:4706:b0:43c:e9f7:d6a3 with SMTP id
 5b1f17b1804b1-4406ab97d53mr125391395e9.13.1745315329911; Tue, 22 Apr 2025
 02:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320-vec-methods-v1-0-7dff5cf25fe8@google.com>
 <20250320-vec-methods-v1-5-7dff5cf25fe8@google.com> <CAJ-ks9k=SxS_zAATadm8SZkfcY2OciYNaty3=WEs2iv5nFJRyA@mail.gmail.com>
In-Reply-To: <CAJ-ks9k=SxS_zAATadm8SZkfcY2OciYNaty3=WEs2iv5nFJRyA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 22 Apr 2025 11:48:38 +0200
X-Gm-Features: ATxdqUGsZpxo4hTBeVYFDjAT0FzOV2AQ03SSUmYtR0Xpk0I7nXbuFoofvKRGnJ4
Message-ID: <CAH5fLggaw7itWuUCHG8KBE4epTdWy3y+wtVyUk9AffM+DOTOyA@mail.gmail.com>
Subject: Re: [PATCH 5/5] rust: alloc: add Vec::retain
To: Tamir Duberstein <tamird@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 4:25=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
> Now that we have kunit in rust-next, should we make this into a test?

Unfortunately, the test uses the Vec::retain from upstream alloc,
which we can't call from a kunit test.

Alice
