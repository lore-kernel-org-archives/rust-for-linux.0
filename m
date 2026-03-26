Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3B82367CF;
	Thu, 26 Mar 2026 15:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774539253; cv=none; b=pChAtzw3JP9sN8NmzxzwbqepC+DhCpyLX7OoVuHvEYq0cyZcFJKEmuLNjJupqFc+rFomlqgNGzW14brkP5FeQtk3aUSejT+bp4sS/Cxoropew+GTL/+63lmj4RLlBU/PgQHUvLXUinrjdlbEfBWaif68N30qMCWulIRU+1B2iKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774539253; c=relaxed/simple;
	bh=xgV59XuiEnYysDHO3gya4Wt5dD2yT9/G88EecQrlncM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YwA4q/renK0p4ui7VBsCHERcrrd0aZsO3/boYwIiiR13o/yzmPdV69cM7K0zV4innwM8GDrzsUAWV966CwhsZ0V43FmoUjTaWiSbL95BZkpxln4tkt1WAys9AagAPQo20WuARAmQ7TEjEQXUUBCBoxHslOMjujLn4R/hyTyYqzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJ8RvohX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJ8RvohX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE2BC116C6;
	Thu, 26 Mar 2026 15:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774539253;
	bh=xgV59XuiEnYysDHO3gya4Wt5dD2yT9/G88EecQrlncM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GJ8RvohXLbA7wvYa2sRPK1Lo0ng59PZVb3jGPflz3k0yZxLS628DwS7OFBV9vp4ZU
	 R17xpwJSGAXLb62bPitYWXSnq/2qSqaQfn8GQjg3+qRz1ipIdE7owZTf+lajjZ7ywg
	 D4+8MvSeOKnLmXwS49cUWCp3IiBhODCDAi1VbajMoCHIYCc8a8VVpfDOJvAGShv1x6
	 wdxUnaGLt8eeDQINOQtrGar/8hDpLUYgHqBGv7mLY7ecZTxbNOPtv6RDRHlQ5tIIYn
	 7Oc6OZSSO5swX7BfBvj+dVHrkJiRj499agrf0eNuorSfxEJTqbl3nHJQA5mG51bdUB
	 hno688MzrrPHA==
Message-ID: <a6fca446-ea09-42bd-a4a4-436e0dcedd03@kernel.org>
Date: Thu, 26 Mar 2026 16:34:09 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [drm-rust-next PATCH 0/2] Fix sync::aref imports
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20260326-drm-rust-next-fix-aref-v1-0-7f6f58d2828a@google.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260326-drm-rust-next-fix-aref-v1-0-7f6f58d2828a@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/26/26 4:25 PM, Alice Ryhl wrote:
> Alice Ryhl (2):
>       rust: workqueue: use new sync::aref path for imports
>       rust: drm: use new sync::aref path for imports

Acked-by: Danilo Krummrich <dakr@kernel.org>

You may want to use kernel formatting style though. :P
