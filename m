Received: from outbound.ms.icloud.com (ms-2003d-snip4-1.eps.apple.com [57.103.72.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8038939D6CA
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Jul 2026 13:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.72.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783171672; cv=none; b=Myqv9gFOcCEuEfHe1rblVYnDNKiTtPMJR5JT4wv6AGy5h6ZhBQS0qY/jHPjvaVYlXGoXhUgPlAs6DnyOpkGOuE3LDBB/9EfnJ0tr2iDCtDsQa1ShEQkJImgbInUj83/1rJYh8b/SBuvARPoMZn3frQHxZimFwXXduT6bVd86aiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783171672; c=relaxed/simple;
	bh=MMuEoZ5JuPOQrwnBFPusrqMamVD9o2Jjfsc9tVJWB/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gR53UArFVf+w9Prs6GTj7QLO3SCB0THwUH6mVZgq1Qq9dSGnGqUoWlTb5wzSUANXnpbkUgXrjp+KnV+PJ6++YCji8Tqw6JpqPTcKCnPLwwrTNAu32UZrInwFQeEyChUD/753qHeAskUkcaxcgSAGZsZtOe+gIM14aws9LfJ4YL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=NxHbdz8A; arc=none smtp.client-ip=57.103.72.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="NxHbdz8A"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-20-percent-0 (Postfix) with ESMTPS id 909C81800A09;
	Sat, 04 Jul 2026 13:27:44 +0000 (UTC)
X-ICL-RepId: 019f2d50-4a4c-789c-aad3-b5dc371ae629
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQhNAEMFXwBeC0oCQwZfBlBcHA4ZWAZdMFgUWgxEAlwXFxZWGRcNVk1YFFoMRAJcFxcWVhkXGVFNC04TBVIHXU1WDUcPWB5cFBcVQENeCF4fTBwdDlgGEgBNCg42BlkFXglWA0MFNhIUXUVSAV4KQRlXHx0DUh8SHVAcDlEFWwBGCU8DWQZYAEUMQB1fBV4BQg5NHlwaH10dVjhSAV4KQRlXHx0DUh8MUE0BQwgKCEcDTRdeMlMEXxFQFg==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1783171669; x=1785763669; bh=xiJsjUyePu7IiTH8NUk2mgD6ebJ9AgQkJCXJUYakxvg=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=NxHbdz8AsbCmKVhZGv8eLbUKISULlnjteFwOJNjj7ii3SBc1tsJ/j7Kjjdx5hNlPL34XpMQstnnCXg+EZQQq+uU5L9CC+KmDaJ06QJpgl+quCDyVDk6WqcY6HrZ3ITZ0u6+VAq9Dt+PsMJ4/KCPeRFcz0K08SwXDvwzPVshbfQ/x8uNtUGoaB/pUGZnJDLOsdzgCsErX8uCffOA7oYl/M8p/VCxxq77AIWtf1ORITk9CEMJdHmzW0QMD7R5GCZq+he/imC4FOY+a8a7/zbWcS15sXhELVyz9qZGmqmk4mOskFTSm3+q8R+yN91wITFI9WJ7c/YDd/YYtLIdezbfJZQ==
mail-alias-created-date: 1769500909675
Received: from bee.. (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-20-percent-0 (Postfix) with ESMTPSA id 4A2C51800A06;
	Sat, 04 Jul 2026 13:27:40 +0000 (UTC)
From: FUJITA Tomonori <tomo@aliasing.net>
To: a.hindborg@kernel.org,
	aliceryhl@google.com,
	arve@android.com,
	boqun@kernel.org,
	brauner@kernel.org,
	cmllamas@google.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	tkjos@android.com
Cc: acourbot@nvidia.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tamird@kernel.org,
	tglx@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1 0/2] rust: switch CondVar's timeout API to Delta
Date: Sat,  4 Jul 2026 22:25:56 +0900
Message-ID: <20260704132558.2253275-1-tomo@aliasing.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDEzNiBTYWx0ZWRfX/roB5kSgqstx
 KYn8Ji+crO54MWgxe6pQTTlna7yYlajcDRqU8lpiNbjRSQ/iqEPU+3ifMt1D18iGP/79UzQ4MLD
 lJDUdeC944M5zxk8VVo5GYv8Zsl69MrPzuJ/mkmBslT//4oE+4xc2UdnYu4kKWZZk8Pu3dOEKF1
 YN7hf3oAtiTm0+NCIkSzygq6vJu3ZkmJjNAEEU4FrGmukA+fA5aBfUpATWh/ws3JeeMr3+QRJWJ
 6OlCOm5gBvtLAq/Bnjdt/H57fGiW6/FSyNWCLWB1RIYiH7q+YSshchOyx9kPgvEWumpaXgDnmJm
 TTomZ+lVkkWgLYQRx7/
X-Proofpoint-GUID: kcTCZqLFVHKXWlZ9CNk2-ntteS1fFvwz
X-Proofpoint-ORIG-GUID: kcTCZqLFVHKXWlZ9CNk2-ntteS1fFvwz

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

CondVar::wait_interruptible_timeout() currently takes and returns a
raw jiffies count (a plain c_ulong alias with no type safety). Callers
have to know on their own that the value meant jiffies and convert
to/from it themselves, which is easy to get wrong (e.g. passing a
millisecond value where a jiffies value is expected).

This series adds jiffies conversion helpers to Delta and then switches
CondVar's timeout API to use Delta instead of raw jiffies, updating
its only caller, binder's ioctl_freeze().

FUJITA Tomonori (2):
  rust: time: add jiffies conversion helpers to Delta
  rust: sync: use Delta for CondVar timeout API

 drivers/android/binder/process.rs | 12 +++++------
 rust/kernel/sync/condvar.rs       | 20 ++++++++++--------
 rust/kernel/time.rs               | 34 +++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 14 deletions(-)


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.43.0

