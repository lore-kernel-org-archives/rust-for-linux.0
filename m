Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F388308F02
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Sep 2025 14:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756997996; cv=none; b=T2z8EMcKIDOeGDAXKxAZOGdbLBohnM7fQc4HF1GIOhG6hBLEitfCG4YrqtYrH0F9MleTHhyIZoIUwPV0cRqqezEVZ+8U0u88RXnYic0YFehmJAt0RztmefMUa0vkc5FTcWV2CQP/MGGZHJZrkLv4NMrphrAww8oZYzBkQ3fMhAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756997996; c=relaxed/simple;
	bh=A80hmLCBsFuMh9D5Ud3xXcTFTDoBIy6F/cbXvZEv8WU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m97kEq1xhvaoh7mmjbc8IMvSAYBkBWlBisqtR4OoKpEZDw8psgdOxba7tlUsK7wSXhHex4QlLlmXy2JTaVsRmQUwEt0cvD6rgbZRQBHvZUR3CbA2vt88FMOoTri/d1swaQbHnEHqnhcxLyO0haqLUTE8m5dw0GHgd/S4+n84qII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohERPzmt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohERPzmt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F99C4CEF0;
	Thu,  4 Sep 2025 14:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756997996;
	bh=A80hmLCBsFuMh9D5Ud3xXcTFTDoBIy6F/cbXvZEv8WU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ohERPzmt5VBCUFWuq40mmenf0prlxYq2Xifbd3DTGjyOTHMSNHFNzWg83ONPxUeN9
	 EgHpi2AVF3cGVjJRbtYGRoqMF1Bt7G4A0UnObdihEZQwkIy7AbaStkHww+7zwreM+T
	 Apjn3LTy1KTwjGaaomwWqyQu9N3Ticw5cRISubI53Dx3YWNmU8WF9czSFqqmjGUkJs
	 XgWfJGoeVnYX5mhbfE5cN5hQPNSC0hPqVjhiULsMI0QU6KskjdmUc3ZLLzIGziRF2E
	 iE1WX64JmwLmSAwuATrS8C6lqxMmemfInztjTSkg+UcYZ479DEOJW5aDF/eXDyw2G8
	 2rctDUPBhMxkA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 rust-for-linux@vger.kernel.org
In-Reply-To: <20250821193259.964504-1-lyude@redhat.com>
References: <20250821193259.964504-1-lyude@redhat.com>
Subject: Re: [PATCH v9 0/7] rust/hrtimer: Various hrtimer + time additions
Message-Id: <175699797757.553433.2072824810352370996.b4-ty@kernel.org>
Date: Thu, 04 Sep 2025 16:59:37 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev


On Thu, 21 Aug 2025 15:32:40 -0400, Lyude Paul wrote:
> This is a collection of various bindings that I added to hrtimer when I
> was originally getting it ready to be used in rvkms. I've mostly been
> waiting for Andreas's hrtimer series to go upstream before submitting
> these.
> 
> All of these are currently being used within rvkms for vblank emulation.
> 
> [...]

Applied, thanks!

[1/7] rust: hrtimer: Document the return value for HrTimerHandle::cancel()
      commit: a984da24e7ac411c95bab7b6c127bae4927f9d03
[2/7] rust: hrtimer: Add HrTimerInstant
      commit: 0e2aab67f2d5716e8db73b6d0719208b44086ed5
[3/7] rust: hrtimer: Add HrTimer::raw_forward() and forward()
      commit: 3efb9ce91c5279d7ea73563d1fb136077f52dd2e
[4/7] rust: hrtimer: Add HrTimerCallbackContext and ::forward()
      commit: 3f2a5ba784b808109cac0aac921213e43143a216
[5/7] rust: hrtimer: Add forward_now() to HrTimer and HrTimerCallbackContext
      commit: ac0a7bd27f6593dfe9ea6b65538bebbbd8322241
[6/7] rust: time: Add Instant::from_ktime()
      commit: 583802cc99bdac95d173aaf1fc58e99993aa1d1d
[7/7] rust: hrtimer: Add HrTimer::expires()
      commit: 4b0147494275fdbea98305f4ddad7e2def7b556f

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


