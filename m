Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0541E8826;
	Thu, 15 Jan 2026 12:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768478992; cv=none; b=SofYTHL0ASVlCKQCzfQE7iaZqcjVm1fgtJu6v2v66FbLUv/YRNsau7gHWgvbQwG0TlNHVhRzzqWIh7qFGKlvm2uuwSa37OA+gAN0k34h0YLR+mgQWouOXFsjZu63R0PoDF2x7oCuv50f1YfIHJY0i15u4VZNpAD+oGfuqy5lXgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768478992; c=relaxed/simple;
	bh=lhPS2y7yAFCh+6kWRu4VHmV3+WXQ2o8nYrfg0UT4Gsk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H4KcBpiiJb+08vlbh1HgcaUrW+tQpdEMXKJSQNDO3aQWcZm4BCbY+Fb705tiMaq+0+6zA9FU+EhoAAkmZakZbFLItaKqyD2q0xsdVJJ5+GjhjRxYkLfon+zjcng/DxgsabiTaP27Vn5l5bs8IsiNoZDk+1mdIRAN7t4vyIMhmv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JA96DQ5J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JA96DQ5J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3768C116D0;
	Thu, 15 Jan 2026 12:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768478992;
	bh=lhPS2y7yAFCh+6kWRu4VHmV3+WXQ2o8nYrfg0UT4Gsk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JA96DQ5JJZWPGSkvLU+jmeW50kMi2aDQk7WJ3NTFwb+XBXWjOCAoEj9MGzpbVm/KS
	 WDOGF7Oz7dkJfmg6rgf9fCkNgWr8t7yyF0hIvgrKy020D6TsxSJKJvHBTQtMnC64er
	 9udPjTcH0hnMWJlV1nVn6htWlppvhXk2vE96WgCu7bKbSkxAhWAhb0fYOKpkdeDmGD
	 lb33LoXk5ZtW4/kmkWC9tPBn3BzuTkEBEDr/LNrpG1M6jwNwEIhfhBs/oSkRzE0QUU
	 /GKvlYAiNAM4OFAqdHTa3LhoAis9MjoENAVDslQMxztVCS2wc4pnUv8hwGTXhSzq6R
	 W8n6CKrdpi/fQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Filipe Xavier <felipeaggger@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>
Cc: daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org,
 felipe_life@live.com, linux-kernel@vger.kernel.org, Lyude Paul
 <lyude@redhat.com>, Filipe Xavier <felipeaggger@gmail.com>
Subject: Re: [PATCH v8] rust: add new macro for common bitflag operations
In-Reply-To: <20260111-feat-add-bitmask-macro-v8-1-3bc0a558ede0@gmail.com>
References: <2JpjX5S1c2QLiHUftMzVViS7xatVGkJperCPqxJU8ZQ_Opyo4KPge5jcRCPb0Gcgyxb4yeFhm6Y-1X8q3pbNaw==@protonmail.internalid>
 <20260111-feat-add-bitmask-macro-v8-1-3bc0a558ede0@gmail.com>
Date: Thu, 15 Jan 2026 13:09:40 +0100
Message-ID: <87jyxjf56j.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Filipe Xavier" <felipeaggger@gmail.com> writes:

> We have seen a proliferation of mod_whatever::foo::Flags
> being defined with essentially the same implementation
> for BitAnd, BitOr, contains and etc.
>
> This macro aims to bring a solution for this,
> allowing to generate these methods for user-defined structs.
> With some use cases in KMS and upcoming GPU drivers.
>
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/We.20really.20need.20a.20common.20.60Flags.60.20type
> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Suggested-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>

Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


I think it would be useful to add:

impl Flags {
     unsafe from_raw(value: Repr) -> {
     ...
     }
}

impl TryFrom<Repr> for Flag {
     // Succeed if `value` is a valid `Flag` enum bit pattern.
}

impl TryFrom<Repr> for Flags {
     // Succeed if `value` is the logical OR of valid enum bit patterns.
}



Best regards,
Andreas Hindborg


