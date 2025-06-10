Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B40B27AC44
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 07:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749540990; cv=none; b=H/ayQYmsLNfWFL8soiuuQd580yHU7Rx+N8nhBiqVErUuxSg53ul6mipyIzwcWsaCa+enYiBtxeqbdTLIgzCbyKjA5kJEgtCOPjnZ/+o2YEUGLSXStXNs9HCWjspXqs9rqm+m8pPfGX0SfMZmec8kEH5AGz6yQgZO8xAaEFbRBog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749540990; c=relaxed/simple;
	bh=1HkFLY3tA8QLbqvJLTm0MHq29mvJlhBrnMb3mUyN6P0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Aagwdr1SGXsFek7RDG7bompNMlUecfbBhcNMfidEqaCcvTR9TBpCuos+tfFvjV+qF5bPXeLyNSSZx3eNh4G6E2Fulj/vZtiwiU4jPOsn5NYtlwEVqv4q0KEu1bhLVINSntVeREOf2UlADNuG68405R8dchRXhXe2QPjh5L9yYso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3jYxSZH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3jYxSZH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50451C4CEEF;
	Tue, 10 Jun 2025 07:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749540990;
	bh=1HkFLY3tA8QLbqvJLTm0MHq29mvJlhBrnMb3mUyN6P0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Y3jYxSZH8scdTS0jivUgpCTb+s/4EAwSNgWy7h4WyUbLIW6Lgw8bPzh/p3BcYiF+E
	 8I2YXz2rjkNNJ5wtamFpMwXoktfzYqKAJHrmgL6rLmwtsskFExOEKy9Lu9hGz43LVb
	 SZhceuPKqmdb/xgfN7qv5FRdETOB0IUIRTS421q8jdP3/bMT5a5rpN0+nzugPCEFxM
	 VWesn4l9HJQ3rPOantBYck6bG4qoqBO22XJZFJYzvwFuMQU0BIg2ITTfZyYP5RUGRK
	 u2I1RTVNz0q0xLPFUSN49K2kNu70S7U0O+YVOG/090+z6awYSxV8hXpBMd79t05GGe
	 FDAALCbz4AwXQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: <alex.gaynor@gmail.com>,  <ojeda@kernel.org>,  <aliceryhl@google.com>,
  <bjorn3_gh@protonmail.com>,  <boqun.feng@gmail.com>,  <dakr@kernel.org>,
  <gary@garyguo.net>,  <lossin@kernel.org>,
  <rust-for-linux@vger.kernel.org>,  <tmgross@umich.edu>,
  <tamird@gmail.com>,  "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1] rust: time: Fix compile error in impl_has_hr_timer
 macro
In-Reply-To: <CANiq72n7SgO26P5kFuA1AnnzmUW7q2_7FtH+nUxjoxjjcMeD5w@mail.gmail.com>
 (Miguel
	Ojeda's message of "Sun, 08 Jun 2025 23:26:14 +0200")
References: <20250606020505.3186533-1-fujita.tomonori@gmail.com>
	<CANiq72mJwEm5aMCsrKAhD2e9p+ZyrL3d+4zOswM53k1pbDyyfQ@mail.gmail.com>
	<2w_xemXUO2dSUIMi71vfN-naCZx1PE9R9ka68JgQUmrvl8J2lm7iV787DsNgkc9ZDfhGP9maoqYqf8WRy8Hmcw==@protonmail.internalid>
	<CANiq72n7SgO26P5kFuA1AnnzmUW7q2_7FtH+nUxjoxjjcMeD5w@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 10 Jun 2025 09:36:18 +0200
Message-ID: <87cybc3v65.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Fri, Jun 6, 2025 at 5:34=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
>>
>> Thanks Tomo, I will take it as a fix then.
>
> Andreas: anything against this? (Acked-by?)


Acked-by: Andreas Hindborg <a.hindborg@kernel.org>

You want to take it directly in the rust fixes PR?


Best regards,
Andreas Hindborg



