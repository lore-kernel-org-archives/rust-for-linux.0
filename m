Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B504E2FDC3D
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 19:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768765444; cv=pass; b=P8f18YHbai9zNbPnq/g5CFxiNxQTCmjSkzMbc0k/qUZ5lsxPUVUSp3MTTbcwP+1+tv3qiyDrrSaPXHxX/xo7OgvXI/91NXmuHAWtpgV6LDgJRRg5q07pm7atmzniwRNNwh4+QYE/2CNUgROEKNg+W73VYTcoCT2WHfwFEX2KYo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768765444; c=relaxed/simple;
	bh=OvOoBGprJLp4lp9R7OL4qZnwqtpoaINfzMpWWdW4QoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OYlZ1mA6hIXrCDolnz0i6KdHxHExtaQ0nJSnTFhnY09scbpfFav2VvjRcIj+rLGjE3SoeNeNKJkF5S3EdBtncLzvEJqQgLclVMh0qILBb6wWpPhEs8y9s0iJOUM20nUa7lCnoKDUGQQdk2hIwma6dqSoJar2cS8wZZcB41aIpYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avz56z6n; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avz56z6n"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b1769fda0eso381923eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 11:44:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768765442; cv=none;
        d=google.com; s=arc-20240605;
        b=VcyffkdY+Uq220EeWPt0v6wTmtqGuQrtOVn6+wAjuaszH/4kUSeaeAyUwzAVneuIG2
         alHCMjvYJQx4B2y5sllNVjdPIS90bWlVmv8hGe6oih3T9ynykH1LUPUrzbvpnurITikw
         1w1dUaOIGvAP51Q0OAFITPku9cPQJTQywqWR4V5JcZk0rqf/EVOktwL7Jk8nkIyzVaI8
         59+76xkNi+jNlRzIUpUpXakXrM+gnnlE5dnz9dn/IJLJJEvXc9UGuQ+xoH9+UF6ZdTLz
         kVWa9qpE7eXfIHgPxnjRT47/DMqHWBu1T53vUnDfpgLRmhieeDrjHkxsT8dRadgoQgny
         1YGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nMJBsHZAvg2jgO530i0j9vH9Ks5UC+30/u+LeGudWWU=;
        fh=3afK+IOSKimaIlP7b1JvIf0oUboHciGm2GNdkSeB/pI=;
        b=BezQFyaBUzqZ/o3W1F1gU4RAxvnCYzI30VVuIS9kPuLTb1urhqFfts0JlbUgvktwYP
         ZzKU9VoyJLaTn5lvf40VL9lTdoaorj1JXIQTMwO3eyA175YjQUCnKGIV29sRRE5BEFff
         QRiX/E0F3VrGHqt+XCGwJT3u6F/MBQ8BDzSTlFCxxZi7E74sr+DkbRn3f9AL48WFYUcG
         q6x31jrxnAV4mq1wNcx9MDM9FlmO/jeb3VL2PzINtIYAeULizb4PL7n8atgOcbE/7NQ/
         YOBz0tgO3SAGPS6p7YZS8F8eny5wBDukdNLAsE6A+f7Zn4qzBEfutIl9ejdXtSPmOjXr
         aPMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768765442; x=1769370242; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMJBsHZAvg2jgO530i0j9vH9Ks5UC+30/u+LeGudWWU=;
        b=avz56z6nRwpTH5a4ExP7dRpWyVOc0XHLGbmRcTj8RW66cTLRZeG0Vo+t3Z9tmacDpk
         s+5ZhaH+u0QxmxzznnJE+QScet0eHoOywcA3v+6wuXm4BVqkF89GEO+CId/WFXr73BFZ
         //FuONBo3ivV61c5X1gnMw/EchtQvdbh1NkQb60pQXd+vQ4hJU7e7wxBKYo4w4caKDev
         Sey5z7qdnk2jvYcEWf/nf3Ue6+PmiL6h7uPB40+kh1b/0BvHPeZWcyq5F3KYbFcQDWZw
         /7HFie2WIq1FkQlMsERb6DTbFrfP+PqkDF6JrNKyM+dZ881ssnurcfsq8vBmiiReHfkN
         Ls5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768765442; x=1769370242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nMJBsHZAvg2jgO530i0j9vH9Ks5UC+30/u+LeGudWWU=;
        b=UmHtuqoAXxyiQaMbzjuSIehE4oVgshoRw7NAlI1zboRcbOSj51cJlPWfuNvc1wy0u9
         1YNxPwJN2bzVsQi048XrVRXbq5iQoDZcWnInd1huBlB+IcibNVDaNmZkRZUnJ7uPuahD
         2P8gBTe9aw9iVAj79zs3aQIHkSiDqSvyx/X1Sot8FZ5nDQLZFq5kSAIKIWAYozx61KK5
         aLk9dqYfjEIjm3bOodYaa5Syriu8n+WSYUbfzxWH/VqSlEgFrAEq9EkzBzRF9NsOyZ4z
         StK5jemkdFxFkm31KnXt/asYVdDr38hHvMl3OffAyTtomTeb1/a3rCu70mYDb2sss3LO
         Olew==
X-Forwarded-Encrypted: i=1; AJvYcCV7BtVfZh4bQgzkotpgtp7Aj+jq7dUcx0Yv6lyOLuJQ42EvwoBIApUAkoczAfVd5l6m3PNGne1EY1oX9aAKqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBEzsmgGChLX544IbNtMOHzofd9SAD/KDU+1jqPXvaiktKsV2p
	VwpEp+NFr3C0MHiByeTJrVEdIyCJvtQkWFT/VTHeYaPTiX2t9S1E3KdHQ4vaX5VuIm6MMCQlJh2
	SSbUXUg/BpIe7LfIqp7RBVie+Lxj8JDg=
X-Gm-Gg: AY/fxX74mbATI3k7L0MuNvrTNnTJO+W2iiSLB2opcewIDiAEred21zmdmGkDszP2mrn
	LHObpYZp3pFnk6W32bBPuupLDsoerUr6ZtB39zCnR/qnf0l7+u1AG4w39C7iyMu50/ZBwo9mUOw
	ACyLcj2QYoJWKkcGfnX6iukUMuOohuS0QiGPead8ZM4NDiF1pjXZavKx62vMfeoAr83ig/k51Q7
	Ya0vUvERpVsQQA/3xtmJpunjBlRMHJnNfKaavb6j12Lb2wLP1kVfPieHIjupJnZGztrdkeZLQdA
	6gAeJRWFhquyC30OgTOkbTcUBcfF5Jd2BaitWJDypxNL2CgALyf/XaplAuHwpVwbnFqX9Zgae4y
	xuorH4wt62roG
X-Received: by 2002:a05:7300:8b9e:b0:2b1:79b7:5850 with SMTP id
 5a478bee46e88-2b6b4104734mr3500549eec.8.1768765441878; Sun, 18 Jan 2026
 11:44:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116-rust-analyzer-sysroot-v2-1-094aedc33208@kernel.org>
In-Reply-To: <20260116-rust-analyzer-sysroot-v2-1-094aedc33208@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Jan 2026 20:43:49 +0100
X-Gm-Features: AZwV_QjvE1ceplgby8cVlzgNQ2XCnBx8G25Or5n3aO1Hxy5CIyDbJaTII16_ahk
Message-ID: <CANiq72=tkxDhXiD7XnRyGCb7Ff1Ko0+oahKCAzs6TLRQZMwsPg@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: generate_rust_analyzer: compile sysroot with
 correct edition
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 9:46=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Use `core_edition` for all sysroot crates rather than just core as all
> were updated to edition 2024 in Rust 1.87.
>
> Fixes: f4daa80d6be7 ("rust: compile libcore with edition 2024 for 1.87+")
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

I added Cc: stable as discussed in v1:

    Cc: stable@vger.kernel.org

    [ Added `>`s to make the quote a single block. - Miguel ]

Cheers,
Miguel
