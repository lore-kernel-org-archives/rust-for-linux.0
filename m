Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7403A0B1E;
	Tue, 24 Feb 2026 15:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771946264; cv=none; b=tZ6omGANmwnRHE4ez3zAetBlAkPu9WjtDSfh8JrENBj3G+1NQaSr78DrmYB81CxzjWbu4tsdJMP17XyjRTbbb4Bdgc1eZ659EAWnWLGb/1Lh8lW30Z9cj3zp35TeOLytzPj8VzAgkuw4stdwlCzCMhL7lc3ZIPr5EULtQv6lQrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771946264; c=relaxed/simple;
	bh=1Bj5QO/sZIgAv9PKzWZ8aiOMalGgR/GkNuoz/EcNLQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IsUYZVB6+en7eaW7+tc93XqyOMeGFwytJXUA7fMoS7zCEpKStLIy+QONgL0AYTeO2cci5JPIhvV8pc5qdm7PUa7UFQPIBFM72VrRcK/zTqsfRuoN3kFyr1NgQtMppiD2+z50UOhZH5Pl6IeRDvnqGSH8r/IYtToKB+Q9V0ejpi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSuchcjU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSuchcjU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C1AC116D0;
	Tue, 24 Feb 2026 15:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771946263;
	bh=1Bj5QO/sZIgAv9PKzWZ8aiOMalGgR/GkNuoz/EcNLQc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lSuchcjU/2owqJhZ1jM1s7aF9fhsUAb/DeV80/FqAwmXv1RmmT4L/nVr7s9W/KrC2
	 hWoHW0NZwfBKFc28JbpsVNDcmbw8EAMLOyP+kO1plYYxd3vvJ0NAiBLgihOW3XyH88
	 OLcZZmGVL39VgF9L3Nf9wA/Gtq8xJ2WwPEuU/0Wolwd3FGCYSlT37ROpJpugSOk6qA
	 j9WJLPBwUdisUoPcATackch+IlGtFcY7p/zGo4W1NJd6pbZl/Aw8BjZ+sBR+AZDp4x
	 TBD9m7ciFH8MYZb1pJp8dH7cNRFuToiV3wH6zaRBu7Salev+lp91RtJGv5Dp/ZvjwZ
	 patqViub4840g==
Message-ID: <e3f1facc-c077-4453-8960-3d31f2a322ed@kernel.org>
Date: Tue, 24 Feb 2026 16:17:39 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] rust/drm: Fixup import styles
To: Lyude Paul <lyude@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Ewan Chorynski <ewan.chorynski@ik.me>,
 Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Shankari Anand <shankari.ak0208@gmail.com>,
 David Airlie <airlied@gmail.com>, Atharv Dubey <atharvd440@gmail.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>
References: <20260122214316.3281257-1-lyude@redhat.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260122214316.3281257-1-lyude@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/22/26 10:43 PM, Lyude Paul wrote:
> This is to match
>   https://docs.kernel.org/rust/coding-guidelines.html#imports
> 
> There should be no functional changes in this patch.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Applied to drm-rust-next, thanks!

    [ Move trailing `//` at the end. - Danilo ]
