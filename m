Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858952F3608
	for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 19:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769369075; cv=pass; b=opjR6xp93U5sLfjynKpNdpjiZ7SvjDRqtmKSdaqKAlEpPFuR9f3bMHEydwwpKyWWa5x0qJSLOSX0dSguCISDeuFGr+M+AyqOQYDvU3lG5gEeCnXIz70rKlkEcqf4cxape0hBOREm954VFLUeBfP3vvSbiHF9AYpLhWH2SUfxSpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769369075; c=relaxed/simple;
	bh=fJt1aWSEMWk6/aewHrMmpRAYrvpwaYOxGHD1U6zPqSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HeWMidLoSCPdzZYmu/5Zhc02hRkx+giGCZn0GE7PeiVxIBkNT3Z0eaAwpZOaaFvmMXmy96AsR0AL1T63d35S2OLggsGGJMS+2a6/0kbsls8JN85I84lpqvkbK6ExaOEdd0VWMkaRJvkVI+grNHfTpMznk6dvHq1uMh475SpPuuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEFgpV5r; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEFgpV5r"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b703e04984so228603eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 11:24:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769369073; cv=none;
        d=google.com; s=arc-20240605;
        b=UBzxLI/s5n1h9/nWM8zfJzRc7hMGhNbHF0CcuOM8zdU+6QfQEFhxKX5HQaaK7Jqu4A
         ERQ4bKCrXi9alNq+wsOMHGAi0+gF8Y5FtjTYtQbfJe/wmQaDcZ740ApsYNyF4qQec2hX
         qXa+qvm7OdoE9JOtId2CLVxgeDRDRNdyxuxouQ5Ixf0AuX+6NYrrmS2xe1rtvoTF2Hxs
         GlKtPzVpaJCQZMC8d3TjlDUD+WeI04ZChxsN1ZkIUpwkt+MB8xbT8F+Z5Jm8sP92VnzN
         WpKo21owcK4l/DgKQ0AX8I9xQ55g5oby3N5+n7d/bUCD7rrrbF2KYiPFzW/S0Uh91RLD
         EYQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fJt1aWSEMWk6/aewHrMmpRAYrvpwaYOxGHD1U6zPqSc=;
        fh=WJXCT9MQHNDJGFDlF2PUR2x0/PuH6fCTzKmKeDK1SCM=;
        b=C6MmWKHkPVCfAD+AeS3Y8oHUbC0Z/F3kFFHfoyrv4iILthR85pW80kTIUyhkJiYL3W
         q2QFXuNRO3D1/eNWH5pce6x24bRB9iVrmkTkqMuUgJAExnbTPeZcIzJ43DebKDnKlC9+
         bUnMnUOuCv69kMwc/q49ya0F4UOEHsFpnH1UfWWitHRqeHPDvVTrR4xj1sktJ+zOo+b1
         Dh+whYs1gTEfG8Wid8poFvTfqpHhvKbzQhRaf9Q+6BiUhzYuXcx2XQozQlHCElZTkzIB
         7E0I9IaVAaVdmbvR/NOvTUnS2NOL4r71Zo72fVTsd/9jJyMZmlrAVbAiFdKTt6uXdy7k
         lmfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769369073; x=1769973873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJt1aWSEMWk6/aewHrMmpRAYrvpwaYOxGHD1U6zPqSc=;
        b=gEFgpV5r4v4bi0SkG2egM0NZz26jUr2XWTTp3YRyfPj9c0g5VCAhRbIPIB/bHWADc6
         Mit8DeBrWP3ZeuOw9644hD3R85W1xidQAQoUuS8z4Tt+q3iiF96rCcU/7mjjQ1n4qru4
         4EYoQyuyNSnkOBegIGt7EDRdbjxL7Hfr51zK7c/ZLHJ9fe2+iLTKzNX0fr6KWYTT0VHt
         Pslgg8anyCGHHcyG3V5ZhrDRYLX8jHEKCkdk+WdOF+X2uXb9kB6oKi8QStNFnqvlLHwf
         ObgQYu1osxPsBgxQvu1rnhw2HNpCHW+vZw9STee4Cv4Xg5GpHq8HxBGz+Qb9BI2KzWxc
         H6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769369073; x=1769973873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fJt1aWSEMWk6/aewHrMmpRAYrvpwaYOxGHD1U6zPqSc=;
        b=jldho+Ur/nGNwAlfhWtTsJG8UdBc1r5KGMi5GVQIAv9SgvoDFJ0Z1FMwpEBI+7Bq7q
         x8XJbagz4Rj1jR/5MeETaBfdT323f+Y9wfQ9BwqY/u8n27zYHXGiy2DZEV8K72EYfno0
         NDBbM7/eBXAw+QzpK2nWv7mWVzfbfq0IMfzebq8k0BHDa+NdQeEqP21HqBOhXwAMqrSj
         yZGQGVAv8tMrNtz97z92UvlPtoZfNplXRnXAQLXFufy5C6wgaBELcX5oHsNOPM+OPDt7
         dtVo9ZYzHRvJiW+/JrZGn5xwdLtL2mkecQJbi123ej6lmCzjCL5670yG9pEHlcmsX3KT
         nG+Q==
X-Gm-Message-State: AOJu0Ywc5zFW+3D+ohlR/Pt+ip+40z/1ZzQ3iggvBr+5AGWq1xQSQwD0
	s1y7c90NzSCtLgxkPklUoDuUjxqBgqpcu94fy5fRXb7V/WfY+ZA4QTzscdcAohRkMd5y+G+QBM7
	7LSBL4Vvkq95/nhMrRS0XXWNeGkoEg3bQTYN2LBA=
X-Gm-Gg: AZuq6aLeRdrS2S8PSKw0o6Mu6IU0rpYO0Rnc/T+kxzCUF/gKeq/Vl22N9SSyE0hXSLS
	8KSAhIXgbP/08jGOoNmcRS8X40Nh/ch9wkNWEcYugKNHGQsddw/uoppum69BD++SB79ogWoTLku
	0JbOzUXAmXKOjyGcUCvLOvuIW9iIp+ysF3inINhCyhzBWsmUUKF9Kx/e2knZmvxwF2bMjK72lVs
	NdeWnlyiIVzRlWstrUsWRxvNCmmdB6izZ+KmnDgbZs5KPvB0wDKS8BorbBl973cJhx11lymL1pL
	ZGNK5zLfFUSWI+MOurDvk+gy6pLeu0Q3CphyPRjP0vcd9pAvX9vHbdglPPqm3eB6qJ5C9gzv0rE
	mIbBAtkn0h5VdNQGj/iLmmcM=
X-Received: by 2002:a05:7301:3c9b:b0:2b7:1c58:dc9e with SMTP id
 5a478bee46e88-2b764828eb7mr520760eec.9.1769369073416; Sun, 25 Jan 2026
 11:24:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120083824.477339-1-sunke@kylinos.cn>
In-Reply-To: <20260120083824.477339-1-sunke@kylinos.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 25 Jan 2026 20:24:21 +0100
X-Gm-Features: AZwV_QjDREbio0IoFTAHbZ-eJZbTeAtJFKB9XIxWxKudwvxhwkHbNFyalVQ5mlc
Message-ID: <CANiq72noQv1rE=13CP9Ci1WAUONqN0bqq-z1r75n_572ZWA2Ww@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] rust: Replace unsafe core::mem::zeroed() with pin_init::zeroed()
To: Ke Sun <sunke@kylinos.cn>, Benno Lossin <lossin@kernel.org>, 
	Atharv Dubey <atharvd440@gmail.com>, Moritz Zielke <moritz.zielke@gmail.com>
Cc: rust-for-linux@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 9:38=E2=80=AFAM Ke Sun <sunke@kylinos.cn> wrote:
>
> This patch series replaces unsafe core::mem::zeroed() calls with
> pin_init::zeroed() across multiple kernel modules.

A few of these were already sent by (by Atharv and Moritz, Cc'd):

https://lore.kernel.org/rust-for-linux/20251129124706.26263-1-atharvd440@gm=
ail.com/
https://lore.kernel.org/rust-for-linux/20251129135657.36144-1-atharvd440@gm=
ail.com/
https://lore.kernel.org/rust-for-linux/20251030-zeroed-of-rs-v1-1-1c46d0251=
28e@gmail.com/

In addition, they were also sent by Benno, and in the issue he
mentions "re-sending", which usually means just adding your
Signed-off-by below his. Otherwise, if he is OK without authorship,
this should most likely have:

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1189

Cheers,
Miguel
