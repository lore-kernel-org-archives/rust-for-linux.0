Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3EF2620F4
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Mar 2025 20:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741120960; cv=none; b=VNkwodPcsctuNLUicGeUKXT5YW+5yOLuf3GCMp+sF9FoNOWPhx6d8ip7INrjZXLZqx0nbayv3fVhPTeofATcIVM/C7xMDOaJG+rYRCA8syajm80wy4lnZp9o3mAsgZuk33YRewYTKhnZFmEz38wXDqkfKeJDJUTDgZCqPAnwE2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741120960; c=relaxed/simple;
	bh=hY3ox+Cv8L/hy1uWd2H+uDH/wZ7y6rjKqKarmY/cer8=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=e3ok1QgII1/lzSh/WH9Iuwb0syx2SxN8CfWQZuUA+zJI/ObmVb9C+vVCQOmCzme61KR50aVQdrPmRh3q0+WkSVBs3eGo/6TpKyI2rRqkyDHotul9Wt9q03fWA+gH9qtYF8tljF9zq+hbPvb/WhGTiiZlMg2DrwBpH3gvUpQBA0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=XGwAZ2uq; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="XGwAZ2uq"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-475076bf02eso8472451cf.3
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Mar 2025 12:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1741120956; x=1741725756; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R1qRuitdwwYSELTXdkDkMV/eQ1X4sgsaSnPBdxYSrvM=;
        b=XGwAZ2uqxdiAH2xE0p3xo9XIG3BZ8wSwL4Vgycku8YGLHMfJg3Z8BNOk46sxsDRbZ4
         EWC8F81xDdEDHpkpU0iMF1irO7cdwFqR+8pjY6SuCokEw4/NHXyhH+JPJZnSYop7qJJZ
         pWGbgQTX+iiX4l67s0kb956n0RDaMMhTon2LJI3NvQjXcxdCNg9Ygb2TZuoWrKG3w5im
         JK8hJCAGfP7gYWROVGPVInwp+yRyAa+zaBvDBZSFRv1GRNGtHdcnwUyYcMjjBcGuC+HL
         tkUaJRm9SaALtwiRgFgDpyBcX7FE0fOFFwR4oGxe3a2EkfIM4rzF0+Wp5/6iPdMszJEW
         w30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741120956; x=1741725756;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R1qRuitdwwYSELTXdkDkMV/eQ1X4sgsaSnPBdxYSrvM=;
        b=gHq2PNk5JmiA9P9FUmc3BrOo73sXJcxmjHYI23oGmYrBaMpv0Un6sNelqPdXTNa/9j
         awY5Sayzg/xOE669syEnWmnsUSB7ITVTfuyGbnbovtvidSSVAHBJLJKYi/8V3J6PXgMN
         A5PhA2QZbCkGcDyFnFsYC9t59hUnVbQBGpaKiFN1esADREkpFw+36venIxlCDGxJnfdq
         BVZJuit0d6s37zNNv/O6gHoU8f+ly9K5puRoSqZ2WObYEdpmcz5Cm5meN8kHs2I4p4jA
         htUUq7zGyeYk/Y+VKe4nUoMlUlsfYfXUeS+22plDsBiYX4TRkdw3gjVt3seap3fyRyMJ
         wFBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQd5fbUQSHXwxoi+D7yEPV5wJ+Bh89w+PQ2wHFOUVnpXwX/3EcME+QksElV7NdR547se7MeKsxH9ZM21Wr9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUX8IBfilKwxKbSEmvyIyg7oXi/D7SyVO0T1/vNSZf0a5uR5qW
	SSKxBXL3aR2itLObslx57EMkMDrCsnsiSFSv1VC5blRDNvAef5fEEG725xRzlQ==
X-Gm-Gg: ASbGncvGeXsDJYNY+UbfUzE9H2HtJYhZPdlBCfs1fXCxjJssf1hdFsGA2Thz6fCaDAa
	d5zRx+mbO4ThsVgbEyc3pVm4eTpEiec/95qXsfm3XLZhN2hhldoHolrE9Ma3EIL4mLMvnt7jELc
	aM/2wiGjoIuFiDOB5T2sojLN1CA6YCz7s8Rcq6X8dSxKvlQ7t+Tesm6mjv99nldFxOWb9tWCaax
	67tqHVWCRUyIqnw3A7NO5SlA42XG9udWfh5tNEGBdc6/O4lCSC2E8FuqpqiHohg5LbNv8Kx8w5s
	puZLhBySGTq+3Eq7VC9z+KroZhyYE2rNPa8WRprMOrL2DCE5s6rjtfKtQ6knTG0iQxYUMgndMJT
	QoJ1tk82NpRDWiQ==
X-Google-Smtp-Source: AGHT+IGGJzyx/Xq+umUg8sGni4KDBOk9xYnclv58VIy14he0JdzCkkSuM+jn28L4VU0r2ABS6Z+JDw==
X-Received: by 2002:a05:622a:1a0b:b0:474:f38d:58d0 with SMTP id d75a77b69052e-4750b245031mr8398401cf.3.1741120955860;
        Tue, 04 Mar 2025 12:42:35 -0800 (PST)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-474ff3aa7d8sm12524121cf.30.2025.03.04.12.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 12:42:35 -0800 (PST)
Date: Tue, 04 Mar 2025 15:42:35 -0500
Message-ID: <00f1cac46dcba6dc8e2e602674b55671@paul-moore.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250304_1539/pstg-lib:20250304_1539/pstg-pwork:20250304_1539
From: Paul Moore <paul@paul-moore.com>
To: Alice Ryhl <aliceryhl@google.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH v2] lsm: rust: mark SecurityCtx methods inline
References: <20250304-inline-securityctx-v2-1-f110f2c6e7ff@google.com>
In-Reply-To: <20250304-inline-securityctx-v2-1-f110f2c6e7ff@google.com>

On Mar  4, 2025 Alice Ryhl <aliceryhl@google.com> wrote:
> 
> When you build the kernel using the llvm-19.1.4-rust-1.83.0-x86_64
> toolchain provided by kernel.org with ARCH=arm64, the following symbols
> are generated:
> 
> $ nm vmlinux | grep ' _R'.*SecurityCtx | rustfilt
> ffffffc0808fe8a0 T <kernel::security::SecurityCtx>::from_secid
> ffffffc0808fe9a4 T <kernel::security::SecurityCtx as core::ops::drop::Drop>::drop
> 
> However, these Rust symbols are trivial wrappers around the functions
> security_secid_to_secctx and security_release_secctx respectively. It
> doesn't make sense to go through a trivial wrapper for these functions,
> so mark them inline. Also mark other trivial methods inline to prevent
> similar cases in the future.
> 
> After applying this patch, the above command will produce no output.
> 
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Fiona Behrens <me@kloenk.dev>
> ---
> Changes in v2:
> - Reword commit message.
> - Link to v1: https://lore.kernel.org/r/20250303-inline-securityctx-v1-1-fb7b9b641fdf@google.com
> ---
> I will also reword "destroy"/"free" to "release" as suggested by Casey,
> but I'll send a separate patch for that change.
> ---
>  rust/kernel/security.rs | 5 +++++
>  1 file changed, 5 insertions(+)

Merged into lsm/dev, thanks everyone!

--
paul-moore.com
