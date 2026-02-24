Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664073A7836
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 16:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771949506; cv=pass; b=pai+gWyWKODhfNT3YXRG4Kj+srd/gP5dzLK5lH9Ab6YPWBWL5uQL0yzC+k77KG1PiikzEkrC0R54yMOlTnKMcZlSmUs8uw2obqW1Fl53+pgsm4gQ1CMy1wdQuV4sCazMRfLAoL6fjdxE/Pg2pW0OUeQcPuPrj24EH1/DpXSVo4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771949506; c=relaxed/simple;
	bh=NUNCU2GIMtjIyqB1CWe2UKcJXsjFlsTp4gPrSNP7eCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sPsAN+u9FMJgW0Ekf9PZN/m/vL7y59PJqB9zRo7CrfB5aiCzDUIlmBLIrmaNmJH6l9ycIdtcTUYt4LgaEnyynrtXa+w1T7KFk7/6SegD2zntSg4zMIzY/GmYnY5WrSPtJNpIHrEUrMAja1jncIUuKDdISlkYmlT/Ox62s1czSfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddcl7BfV; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddcl7BfV"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2bd6228af6aso343097eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 08:11:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771949504; cv=none;
        d=google.com; s=arc-20240605;
        b=Oz+6gbuJ5K3BLGnaKj1TY5lYmo9/AbVY+JpaLSQ8KwJoq+Z6T1GKU+33rY/I2dFaUq
         UwVncVLRzrBqpBqWgiw1HVSfbnNWcmkxFCf0UfMo0MbLA/oz3RYuf9kVH6rI+eZqdu+U
         D8MwMguOVRlaE+Y+FXaBwxi+rsHl/bUJYQP/BqdaovBEoonP2e6cPrV6QhXmtzOGXMrQ
         dQh8YI84PxWXfKvy6xNqOmK+YuVWbXFdGjzAe1Q0p0Pe5GSoWSQR0Okb42a2eg3aNFW+
         b7d4wYnfP0yhhqZyu60YgM8Hw3blWPLFk3gCBSNBHHa0dNbwjtbbm8Oi2Q8IRijNv713
         rHRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jur4r3URtRbpSYoqkV+RmME32+E9scyKj4lZV3ZmeDA=;
        fh=zSTcETl80bFKd1txnlS/oOK6LYgzQE8anuM5tnzCELE=;
        b=dVNC8oYS/vZH2/7gotj+1dUVPELQFNZdD3QR/arshj5irTcZQbMARjOqqiZFLSwZeY
         0E8EIgdr5KOolM8vkMojOyAoX6pZYon+c+lpbJpIIZue8jINACXW24ra00lIa32pVn+F
         PapTFaf+uybP9SyqezBnoaWkA5cv/9Nw/fsUmp3PM1LRpmNGxA/igmh5WxfsYbjCOoPF
         QcnVl/LBOBAzoT6lidbjswt16LHOyIbtkDcREVTt7NxoUcd1Fl+1j4eMgq1mMSKKtwWZ
         pQCbFUa7IWuNP6MzJB8BB73pb8l5DmWpAJB0rturgJPAOsdJvuyLRggcNIW/qS7jAcwR
         RXCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771949504; x=1772554304; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jur4r3URtRbpSYoqkV+RmME32+E9scyKj4lZV3ZmeDA=;
        b=ddcl7BfVKfO/RPjV+HAc7dh88G5rXAq9Ci4haBls6f7kyY9x7/1Exe4e6iPsVzciUF
         LyUOAiqYr24eCk1Yxi/ZmtoLhQ615vWeti4mID3A6+tedactiLa7MGJ7zCRaCMd8XAY3
         ZZjPzR3yvEV8LEuysCUcG9bA6nremfZh5YJxaVO0MC5Otk+9OQ0zRlByTM7c4Fy08SuK
         92sBr5sYfx/d1QpyNLtiRUeJ86bz8uDoupvHO7CCPDxOhzco2tcjBmgkVCMnJedGY85/
         QSN421lmXM8qn4IOCsjta/hNTqfYiq1GjUvfb+nFikzTQiin5lSMMmlFLlOKryvdBBLs
         7chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771949504; x=1772554304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jur4r3URtRbpSYoqkV+RmME32+E9scyKj4lZV3ZmeDA=;
        b=xQtm6xuwNpmYPISHcNA+uR5liliY7794WjJ+pHtER6xVxJqVHun7RVxte89WOamAZf
         C7Jt2dP9cheS69zYqw9NpguC8zPTEeCCKzhmKfm/l1wvYrGRbWepwd2Z+11TkSDIxeBd
         19riAg/5GVWztcA3kY6XShUczuBMsmHerRBhXRLo5HCbyPkljQstKjRDulESyUH+Hqp7
         7MM/dRpakonCKsk3+MmDM69herkw4uzVTERa+PUJYEdwWxInIJycCxD8ymppFqaoHEzP
         gyU4HOhX1fhc4TVaEvwC8Nn9BnPvWbtSMN5pV2sL0pRmZebRKI8mfjVv82OmvZwlJ0rJ
         yBpA==
X-Forwarded-Encrypted: i=1; AJvYcCU6+LFQuQnTiyZkZDc0xMh1nl2IfgUKbHiMpFE5z0JX4EPm7AvJVkBxPLy0Khhezh55qFFzm6h+2qwzbZ59pA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn1NLNuePbSSeLrINBhTlKbQajzzhb9zN5Nq/bywZ9kDQ65JRK
	4kxZSw4S6m5EHSo+gIYszDoYl6LgRU9mRAGdxkEVFHXLd5B0xHNAJB+KqwwQCSh0F1uEyhm9X4L
	tTwFFsqxhf29+NVRGVcwWO7NgsZMi3XA=
X-Gm-Gg: ATEYQzwtsoVa8nzH8M9t1hDflhLu3Fp/nWPBgg6FX5Z0aw3GJPaK5WbYAC6sdezf2YI
	wHtXUz8zzo2+wAFVXifX3vb/yX0ehWmdH/lhXA7WM20GfWB/PiYpIrh4kwq2UgZAxKb9EBitpHh
	ns56fX0uYJP/POSPQfoM/xtJEDgrA/mrJyGEwNq2eY9yCpjKO4Kllb/NVus2RhrK6jzwZOxo1jC
	5gnwBYF8poBbipvuzJBlG6oJ6jrnMy5aaorYG0/hO5xlVKUgvAnS3COr1Me+Vj7+p6GsTZBRZeA
	1TewkdTi6SgLQVY+senZiN1bN+M15IqmE9F45Qnkt30xProFIs88t+2WVC5ZG/rtBwokc+J6m4M
	dBBO7+vHcIWfjBXgDSmEKmL+SGstd
X-Received: by 2002:a05:7301:d8b:b0:2bd:ab6e:5d44 with SMTP id
 5a478bee46e88-2bdab6e645fmr740559eec.3.1771949504264; Tue, 24 Feb 2026
 08:11:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com> <DGJN2M93S4ED.3272CCZWMRYOA@nvidia.com>
 <a7be758a-65ee-4572-b8ba-6d4a8d65af73@nvidia.com> <CAH5fLgicH9u18pWYYkQqxZBT8WEig3bDP8JFT9VfDtG6McijQw@mail.gmail.com>
 <7cfaea1a-52aa-43ee-910c-7fa09c7f0f4a@nvidia.com>
In-Reply-To: <7cfaea1a-52aa-43ee-910c-7fa09c7f0f4a@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Feb 2026 17:11:31 +0100
X-Gm-Features: AaiRm504WJbcYujrI1qvWR7vQ77IFqUSflxWGLgVRz2-WrhyZR9I3tHBCXfzaRc
Message-ID: <CANiq72=B_Pyg+yFkEv+wq5JZ_qmvKjEaPXObrLDHo4KYO2H9pg@mail.gmail.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 5:00=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> Ah fun! Ok, I will add it in in. :)

To clarify further, the reason is that the crates in `rust/` may (and
do) use more features (which still need justification), but the rest
of the kernel is restricted to those in that "allowed" list only.

  https://rust-for-linux.com/unstable-features#usage-in-the-kernel

Cheers,
Miguel
