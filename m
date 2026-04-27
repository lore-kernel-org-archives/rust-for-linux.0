Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7633E1D0D
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 18:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777313861; cv=pass; b=vAYv7XKLqxxmNkjB7hpzzi1W3seTEKUueiYL2An17ZejR8dCV/FB1GAb9x7JYZHfBktG7t6EPG5hIGFbMAhdCl5SnGLycNDGgdJheCeXk0tPqgAx69XSBTYFZx8YEFQ6hF2L8EJGJkG0zOOxDhqajt5mA16dGYZgS8o8xBbdw+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777313861; c=relaxed/simple;
	bh=9/qaeE/0ilnaSX4v7PgMbmfkJgUdA4noaM/lruNOwSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RDe/V4bszhxubI30hS2x9Rzo7JoTz0efZFGflrtLQxx7qHJAP72N14XrnFRpZWIOnYRQe0nLqMbx4o+HRyQTiHfbW9Vbmbarl5cBRf1K6hwwqPvUAAiS6WXNzUBRiENK5vwNh3HT+7FzvX5hdd2/e0dJ5Rm4VjIqhwPZnVAnNgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glFmjU6E; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glFmjU6E"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2daaab98000so624860eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 11:17:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777313859; cv=none;
        d=google.com; s=arc-20240605;
        b=PXt/FaKSMJdzrAkA1kB8bG3KmZ88b/rszQKe4DZgJvFmpgoXXcfNYAqkDoHvVzYdTr
         BM9bRuSwFgjWCL4kOuVDGNkOMn9QgSCDz305Km7oE24B/gd04nKjhkMnzd9ik3xJAjG2
         pSKp9FSKx0VDu3uTG4yW3ePl8O6fIWOzcER9CS/egZ2Ub94tmKfShfvpHV0zSDhL4Zlh
         T7MyaqY4lIBJqJ68zGNA81YD80jfwzKhFZV3Db1Vu8LwuDnSfwwsbqu2BGjT1wlWEI1d
         022Q0sxG+2JxAJqyeWwgHB5OdX4h0wT+NNTORI6/zHu/jG2HVahUAM/yNq5o+LrmlRaX
         tABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9/qaeE/0ilnaSX4v7PgMbmfkJgUdA4noaM/lruNOwSc=;
        fh=PaXBVAdikFHfb/jAQtrRzXF0PAW6pCSESHxQ53hfhrs=;
        b=Y0qNJoZ+IuaQYiVuelSuFtojRKXPu8UTTXtD0qxIxcDt6e4vWJyy5pABOOZN6pXQ+B
         vySoC3FSOrUDUjIp1qdcgA1uW0/cwn31z76y7dPLGhSxrS817Q6eGUw6RfQsWkZB+2NB
         w0h+tJDs+tTKR/ZturaMu+tZloHZnDXTW3BKEltTmZjRniuWbSas0eDtm5MmaIZQQAGx
         zUGUwOgXDvT3gxdrNnMXHVSTOI+/RPqPS9MaaGPgmWhZFJYRmOO+sTNdr20p0svngEB6
         8OQJmuX0yDWsT96HcKzQMYuUWhP8JCOdqJSjXh55JqDK8alverLMUfIbFIj1bnjNUZ4g
         RI7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777313859; x=1777918659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/qaeE/0ilnaSX4v7PgMbmfkJgUdA4noaM/lruNOwSc=;
        b=glFmjU6EpjjAmhiikI6XyaFsKJNvPO6HcmffI26zxMT2J75+KxOkQTNJUcFky7EHrz
         Was/gi/mwwiPC8xzzs1jaGtvKdg8OAbByjvFCCLV2mRxOVVYwdeZAEwZe533nxvLhr8d
         Y9B9kfL8JpPbwc8VQSPUDIFyN6t7ZgauNbtpDGIxoRZ/K1xQ7Wgur48eOUSGQGTOPZXb
         AobmO1h0ltu4Y1oLfTkv7DebUNcPLFRqVOd3p8XRIBu/FDpF5fcf4WJCimX6s5oHv/KB
         KHAbJ3Wm6ys2hFKoprpTZVjFKLNIAAqzqnPvOLLbDmdz4vziEuVeim8guKR/j4kTcjEs
         Q/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777313859; x=1777918659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9/qaeE/0ilnaSX4v7PgMbmfkJgUdA4noaM/lruNOwSc=;
        b=FLcc9bg8czyafVS+EEW79hOhKoj/oYxsbRXJaJaSE++cI+xaUzgFsRYrjs0h2E/wwT
         QnjrdYF6Jnp+vIfqHvKkqW4nHqMWrLH9zRtrzroY7v7wbeeNgJLZ2/w+B0iv3O2Om1db
         hVakpoe8A9pisQxOXL6pPEktlGuUyAqKv6CHX+JhiDsvUFZI6tAMB4WKfCBh5lE7si4o
         gWlv6PuJY1uiNbpQBXfhoSwsh6x9iLLUkvfbejCk5KzlFHvtHJT0Et/F+x02qG0TclUk
         Nx1pd8XqAHuC1W+cwylt7bIj/Bw7Nd9rwvwnAlK6rYVc3qCnK5O4HO2CgXS2YcMbu+1F
         tRsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3Yco5E4AkU0GcHQKAiVQN9m9g2PyOUIfjas34xou+CIeuSc4wYn0uX4osk41yCfdQvtSXzxSVJsVUnr5apQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyC6RnnT98ySNTwXObOoLB0gU71gSl9QcRdJ0SZQ0d8H+8+VmjK
	dWsPbvMLBblLCnH8j8oQLxeZLrcdOBwTZVLh9x5DA2OaPNAkv/chokjTXYSdlr0Q5uNMFOta+5W
	xln0vP0n2HFyDXkF3CcwuRw/IvBDhwyE=
X-Gm-Gg: AeBDievf1gauC5JsrAOI5PrZG/4+2YFxqwg0BnO3jUfiEMIX18MclPzAL1Eb13mimOT
	dMGS1EVzhSMvPEZq5rkbhthncNY3bDGe1lNoln1nUMbqqN2bT8vN9mR1aWEZdLNUXFq1ARh+dwM
	fnsvDxAtGkwUMQuZ9s3l0SNsljkWN4irfFyIoDLOI6gRWh4BwDSMu4F2k+8YGOE+5dhBFmqxZBJ
	A6xIUjfkTzqUXKRHK6QAORqw1tBeQG8lBKnDDtK6/hyvoftObZRtvxZn/HDcxqdreEpMMQzMPuH
	RoIhRQyG4DOaV1l6k35R+TO8VZNh0pycgn8bn+bJEOBYlzUButFGUTctrsiiYOSNQ2Sgc7Y9CDR
	xwlu92FdTRH5o42cAFnIzf+gDX6B9AdkXUw==
X-Received: by 2002:a05:693c:2c17:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2ed09b8126cmr15513eec.3.1777313859385; Mon, 27 Apr 2026
 11:17:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427174429.779474-1-julianbraha@gmail.com> <20260427174429.779474-3-julianbraha@gmail.com>
In-Reply-To: <20260427174429.779474-3-julianbraha@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 27 Apr 2026 20:17:26 +0200
X-Gm-Features: AVHnY4KhSNd-WIZ0NrsCVBGrVQlV_jyP2VI5mbSl8TQVMeY9TM9-9Itbq43tbOU
Message-ID: <CANiq72=nCw+zWYhvPMJiG8oOT3zpaD8eGVUgaK5rnSzAiGGjPw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] Documentation: dev-tools: add kconfirm
To: Julian Braha <julianbraha@gmail.com>
Cc: akpm@linux-foundation.org, ljs@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, masahiroy@kernel.org, nathan@kernel.org, 
	nsc@kernel.org, ojeda@kernel.org, corbet@lwn.net, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 7:44=E2=80=AFPM Julian Braha <julianbraha@gmail.com=
> wrote:
>
> +kconfirm also requires the Cargo package manager and an internet
> +connection for compilation of its dependencies.

This will be quite surprising -- I think any `make` call should avoid
touching the network and should allow working while offline as long as
one has set up things beforehand.

i.e. I think tools and dependencies in general should be fetched
and/or installed beforehand, and then yes, `make` may use them,
without touching the network (e.g. passing `--offline` or `--frozen`).

Cheers,
Miguel
