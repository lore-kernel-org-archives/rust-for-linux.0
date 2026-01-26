Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BFC28C87C
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 04:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769400959; cv=pass; b=QRu+GDJaA6zuea4SFKMa/sHWJNKMXhW3XcgbyS+JqRNXHUZGsBjDJNs+0HPptkY/HhOscExsg6dxZbyPCKhYZUI2MDlo2XujANLHGoVGWWS0dzKg90yKsxPc0AKkh7721vS9V9Utamxeqh614QULkXc2nn/n0+ec1SjxrUext3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769400959; c=relaxed/simple;
	bh=4sRl6QEMGhNZFC/L8o4zXGaE9Xe5T4wa80O+hqMUdYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cGP80VRfmp7ooftuBP6G4A6FaLVQBY8UabVvsAENm4ObfwpS/U21E4DCezOiRQGSxTSHq1iLQErjEDENGosDKTXMy+NXR45eEwLfVqtBr4vDLzo4y5cue4sz5nPndF9uwVi5iPFqgXGNaIValq62AdNnrmlHeQL10/4rbDwSHI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYMiqTua; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYMiqTua"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b6a868ad45so432110eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 20:15:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769400957; cv=none;
        d=google.com; s=arc-20240605;
        b=C/2lyeQ7Vbdw1wrKiAsj3OiPG1FXOlfHucuCzgw6j4wRaFpLrMKXB2Z9m4gm8nfblT
         mysjeGXB9bNrgBgtKiZtGce0uzPWNwWKoNTzckiMhtPZeYfUvEJ5gRB8ia8DcsyMe3la
         0dWP6NDMvyDn7q0pJlXJI0i2SMwBPbirZM1Ll5Z6iSa6gflYJau47Pox4WAeNjypRNwn
         avQvq8Tm4DtxjJ0CJw3GSDBi7pFuNC6M5xXqj47AIa9WT5MMf1R2YHGWHjdb5MPhq0z0
         dn/xDg73UJa+cVgrvbpbTzHWK0lrxDUEW0cMNvwYQCNpK+6xwsR6Kni0VqCd6bexXUgw
         QnEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4sRl6QEMGhNZFC/L8o4zXGaE9Xe5T4wa80O+hqMUdYM=;
        fh=QB1GWwTn3NyJbNeT0Y2FNIpThkEUf9Yq7hHg2+xnDmA=;
        b=B0wSvD19mSTwZUUJdV77MXbwk/HEzbhrpUjIt5fPbQG/p8tV5UuwZNev92wh/5vHIw
         ehMxmWXU3kCoS/23qSmcSLqOR8J9cQgQuu+ifUCKVx4ddnH7EuF9vNi3Mu9zeCJL5FIu
         gSkz0oHYtMppFwUPPPenl8tLewo8E+lSCFPyhnzsHA3l33EHTL5gPNeStiA/VeQeBVzI
         yjoG7TfpDvgG/dX2D4nIiWets39gzE5+vbu17akcm10/zBbyNJhlLEDguGaJ7rwJqmAI
         j9MHCXwwryF1lcrQN0WAQbNd1gPHFTNkGYhZSxEY8IDTJBZGy7vdokZ6H3uT1/mCd6IS
         1nHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769400957; x=1770005757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sRl6QEMGhNZFC/L8o4zXGaE9Xe5T4wa80O+hqMUdYM=;
        b=VYMiqTua1ZQLzsLKQw2eDMMA8+Bdkc9wC5mx972UmgeTE0bVPnAVsAEZIEdbrF5ezl
         lJyO8YQbibI62jZTeAluAD7vut7LL0F+LoLA8KQACZ5niFG7D9YR0/C07tseYGreZwUU
         vYW8L6xHZyj72Nwdh9iCrhmN4MumurLN1ZajZcJ4siB06kD64RQn/SHIEDeSGaMy/qcu
         at6i3QOLPMN9rpCawIq1cYmXBczWcVQ3j4sZrQuVfExfagkX45+Vjy1oKeAf6GABEnmA
         VwNv03zc9vOXjLi7gAySD1b3tl3gHkD+E/+EQS8Shd99m85wleGwydAY3iQzuZ6Zn3iM
         Of8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769400957; x=1770005757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4sRl6QEMGhNZFC/L8o4zXGaE9Xe5T4wa80O+hqMUdYM=;
        b=jS/JycLpGsweac0D3IecEA5pFg68MIhxUXCZhRkGn/TTTKZCof7HqxPadZGSHUjyBg
         UBNWx3wmy6NWx85+dweC384kZ8sA5C93O1cLnKnCpXUtYfVmnUdIk8O/gyM9tLNeP9W8
         jXKHsIZU4BFdgsQaSgJ2oEuG8/ChsOrWnu1JeOVeYso/8SGGvqpvHnZ2+PdzMIdpzCqD
         VLKmxq8aIW1lSTBP/T/1bbV88viODJbzrf6gLY+Fwi94HrsHdBQSAPqmI7q0Qkl4PDHr
         vvVV2PFJovsGpioNessoq1cohUK12s71PQzavXFFnUwdXwLQDh7JDUc/pjZg7LZZhm2O
         G2Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXMewexyesRxcY2pvg8q7r85VVhcFgSpy8hcbvBgKt5SVEngxz1wRcreuJOO96o9C4HyPf3jkOqL2F8xGZkPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFiQuySBdX8ut89dZ7vyEd2LUwHxjZcgjTZO6bBvyscXfzIFRZ
	rkzBqGdsUdbuV6Opqolv4zev5lhAiGGeWKfMiZkw2O19BN2eRO4OE633COeaZAOpTY3M7mRaqj+
	eHylEXxpgYecIDHdhD5YSnpXdCNJcLd0=
X-Gm-Gg: AZuq6aIuFVIZf2nK/tpcUReO1TtSlttlQzKbiNzeUXc6/rYxTcKjeqcuvti+nKa93f6
	LjasO3ggfTcQRNa7GkvSe6IIZMeMmwTFR6oWWyd4hrYEaSwZdwZgiMFhSksq9/O0uhj4hDCMxr4
	2ao7GeBEMdH0JlFLtM98CpXwqm2pXwcDYeXmD0+suQoEOPckoRMHbxz0BbgK1r9f0MpG99EItkG
	Mdjz6/5SdAwh5f2O9h597rz5jaXLNeZoKh3OWhoA46AhSIE0UD0W7J7Cmlj/ntQuRJ1FtpGWbvS
	ju+A7QjDUy2G2qREZCIhxD6ila4ClVV+7oWC2BRAVWticuyOLKITIA56y2R2MDA2+rdIvifAxYP
	HEBUJmVrxZ/mp
X-Received: by 2002:a05:7300:cd87:b0:2b7:2d5e:3f45 with SMTP id
 5a478bee46e88-2b76420a659mr766944eec.1.1769400956753; Sun, 25 Jan 2026
 20:15:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-rust-analyzer-pin-init-duplication-v2-0-a1c76f0d3bef@kernel.org>
 <20260120-rust-analyzer-pin-init-duplication-v2-1-a1c76f0d3bef@kernel.org>
In-Reply-To: <20260120-rust-analyzer-pin-init-duplication-v2-1-a1c76f0d3bef@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 05:15:44 +0100
X-Gm-Features: AZwV_QjCsZHapAOek5NjsM7OI8JLH-dBLiS8N7JjNtU5aKmN7e0b8px5Y1Pp7n4
Message-ID: <CANiq72kC58jdpyxx9AjVD-2cMHVWHAfbhZ1AYBu_MESsH1uYjg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: kbuild: extract configs for reuse
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 5:10=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Introduce `pin_init{,_internal}-{cfgs,flags}` and pass these new cfgs to
> `generate_rust_analyzer.py` to reduce duplicate information.
>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Looks good -- my suggestion was to move the two rust-analyzer lines
here (`--cfgs=3D`) also into the second patch, i.e. here it would just
be about factoring out the flags, and then in the second one you pass
them to `rust-analyzer` and use the information.

Doing it here doesn't hurt, since it will be unused on the script
side, so it is also fine, but I thought it would be more
understandable the other way around.

Anyway, I could perhaps take this one with or without the two lines,
and then next cycle you can apply to rust-analyzer the other one.

Thanks!

Cheers,
Miguel
