Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1F03859CE
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jun 2026 07:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902329; cv=pass; b=sv2yCZMi4vrEj73Qq33qUgslRGBoRCRhIIogr0NjycQyisq8IxlCEqxQdAiO6SOcVbKHgUG49KQDZBwf6NMU81F0tDepvOWTsHvJQdCmFu7UhDNBqKGx7RQkJ9mH1L3YtGKtuqK25SBv2lyFNeCmZAzu4yAOB5bmybpzCNtbbE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902329; c=relaxed/simple;
	bh=E6S/j+KIAIqX6WyFaTTwCZ6dEIy8HQ+cgTxVUvZ+vuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tQ4oa8NHA3/32CAQuCJh8mfbgiyWLtZoROmPuocYKqKUSIDydPCp4uYKBYrjdGnMVCWAOp+LIMXmaZ9wmmbAFwIK8Coiys+IQXqfW1tPgJQUE8od6i7wg19q7mjBxsW3FXx8JqrIrsXpJ7BtSp6+kX2ZEcbcDouXnhy4F4aWmjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyAufkpl; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyAufkpl"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304da3b4508so388630eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jun 2026 00:05:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780902327; cv=none;
        d=google.com; s=arc-20240605;
        b=VO+Iz5Y3dLH8UcrvqOSQmgguCiptP75DXAjTAtLuu91vdK5KRzZyn7BFkNrsPlCQJJ
         lU1Rg2CHLvmWf9UNjLlEGVvEFxCTa8/OLdZdAbDnFg55MceYRXChy9rYFXuoaZR2dPtZ
         +HFsXXbnzSvzXtDstUEnG5FN28tfQSbpnSbHzsXxficIkQZa72WCGYS6LVUgmniq7Ao9
         BCN84jnBrJtqWdif1708B5PB2aYZla/Q/pgtRCCuwl57UsXf53RHj+5MGlRvczx+aZEJ
         6iQ3Z8bki5Fie/DmDLAPcBYcPfHMLHfcvPOzJdLoLZG6M05m13UmxGStsWnmt0PUBvZM
         SYtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OTgjDjW0iNyWJGjqvsWZoe49w6xSITfHiVT/lKWAqV4=;
        fh=xzqyvdbjCgx4paddM894dmKqT1oVn6DgLBzMh1x/eXk=;
        b=NDNpP/uleN8izSKvBH3oG8+gbYmduKdWZX+R5BULHiy20XhS7vU77lZF64LO0E4WI0
         +zE0hb1HXmXjk5thGFUy+YG0nG0X8Sx4OzVE5GmN94cqxF79pZ18EgEaMnwPP5BK4AU4
         x2JVPQ8XYNFVZtiAJ4fwUBMWQvqQ2a/GopxIwh8cYPgNWSRjvby3cbW/oEKl9GIK4/ZK
         uaZJ//VNS22BX6J4U90OzRFi+vcHcoW+gyVWbAmSOeRQqjd3SSFSAznJ7FJxBtytQCZr
         ko8q0ZStm8uIaZNrTR4jflNuWYZPsps/mQVZsAIioL8DlvH5QWuIgrvmgnREe4cgYaf6
         llhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780902327; x=1781507127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTgjDjW0iNyWJGjqvsWZoe49w6xSITfHiVT/lKWAqV4=;
        b=WyAufkpliWdu7H9ziUl52EfBCCF9b3/wlBP61GK0TD4mjlZ7fKN4uenbzZmSQzJIGk
         s8DyhC44nBr/+fRRPdN9iN7dxdAzL9wNnc2yIBEkgKko3E/DHYctteODgwvXF3AqTHa/
         5F9irZUnU9DEyczk+auq2BPuEzdgvI0KigcJYuRvE/VmMghGWUkeS7Rc23aK9wqIhT8d
         1RNlmWJc+zh0wl+zDqt8bOJgTlZH12N9AMxlhy4qfpu3u0MoFfYykhofN63qMO9nehI9
         PrqMUQE1isR+sb99n2ZGCH8vSxFrD1kjtn7Re8rQXEuIMMao+S/ZsgAjPiA1WztKoxqT
         Ixng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902327; x=1781507127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OTgjDjW0iNyWJGjqvsWZoe49w6xSITfHiVT/lKWAqV4=;
        b=Ip3W8fnEgGN9ovEPXsdu6XRP7IRrwvdQ4AzHz0kl22h9KNqmb0lGVTxX8FeKOkglrM
         UFuRkjizzOzYcelyWR7U7HHmkH6jyJ4dJ8KftoNx4RrHyZHtXL2Jxfb84+v+GP6w+usU
         qGGPxazLG3aOXMdOYNFjH+lxysoUpv4cY1WciMqcLvJQKhcGhp4SgQ/Lf8dth00LAgWB
         KWlxiSlJcR9nhfj7E09kDbiRU0gaivYTmu2DQY4xfvUmFHLzC8a9+sGQyYucsoktm3L7
         qrOi/XyTbwiFGNRyNAX+tofKtzyo+9j/DTljsjNMIdIPcQFUUOT3C9pd4DQx1O4/Js/d
         mb/w==
X-Forwarded-Encrypted: i=1; AFNElJ+cpeu6/KqIS5SDla34tym7CezNdcuUS1MbCAvwySZsW8vzzmVi8TCMrPPUt9n0p1QHhElGIgP0asljf659dQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YylTBcQxlXxnZ/fTvm/0syqO8ZbJ/rThbuKHuCml/irE82DTK+2
	zLFqlk96xA1FW8Keood77YbFSZwn2Z9T+LP89Z87zJtriJ5A9KZUkv+civkMiORf27MPAJRr6If
	rwsv4fV78u/KPkiWICO9BZAE7GBlSGR0=
X-Gm-Gg: Acq92OEw9QqPSS9Lar0I29gOTy2pfrkVU77gAuHyu61j7xNe90Y+t8d1RspP1ZFp+M3
	XF4oMnv1WJ9uo6skfip7THG5XnpzfnGysTShnIsMfK4QcRbESQA7YzXgK25SRaECFaLyecj9aYZ
	a6yDXrXSZIMEfg1NZDcoodQLxsSUR53+eP2UMqdnymMYCShYfNk1gPWSwGDYIXLFTISxBp58RTA
	YBZTqftJyMkMRL4oJWlYSKvx4HLMaLjHOjrNN1FDm+pO72qq+dCjhzpvIayKYCRhyPs/ziwMka6
	C0nqVls5Gy0UGDrvd1TRutGmdUMfPPticYYJHCaly0LYnGHrR7Ih8aYLdCEYZn5UQt3EX9yh5oH
	bk9kEGLDYb3kUjn+e9F8xS+atwHm2peELwg==
X-Received: by 2002:a05:7300:80c9:b0:2d8:7302:d3c with SMTP id
 5a478bee46e88-3077b36698fmr3200266eec.4.1780902327103; Mon, 08 Jun 2026
 00:05:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606-bitfield-v5-0-b92188820914@nvidia.com>
In-Reply-To: <20260606-bitfield-v5-0-b92188820914@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Jun 2026 09:05:13 +0200
X-Gm-Features: AVVi8CesUULmJzmIG8x0edIeni_P9lO4e6pOHsp_2M6-VMNw_x1NersZexZHfEc
Message-ID: <CANiq72nCi_jjQ=-vYGMNRe2P+m4fEZMcQDnUDb4Nr9+iAiHeKQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] rust: add `bitfield!` macro
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
	driver-core@lists.linux.dev, Yury Norov <ynorov@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 6, 2026 at 2:43=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> This is the continuation of the `bitfield!` macro which started
> alongside the `register!` one before being temporarily integrated into
> it [1].
>
> This series extracts `bitfield!` from `register!`, adds unit tests for
> the new macro, and replaces the `register!` macro rules with the
> extracted version.
>
> I have removed the `nova-core` patches, because the Blackwell support
> that has been added this cycle (and thus not visible from `rust-next`)
> introduces more uses of the Nova-local `bitfield!` macro that this
> series intended to remove. If these new uses are not updated, then
> `nova-core` won't build, thus to avoid conflicts and/or build breakages
> I think it is preferable to merge them during the next cycle.
>
> This version is based on `rust-next`, with [2] applied.
>
> A tree with this branch and its dependencies is available at [3].
>
> [1] https://lore.kernel.org/all/20260120-register-v1-0-723a1743b557@nvidi=
a.com/
> [2] https://lore.kernel.org/all/20260417031531.315281-1-ynorov@nvidia.com=
/
> [3] https://github.com/Gnurou/linux/tree/b4/bitfield
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to `rust-next` -- thanks everyone!

    [ Added some more intra-doc links. - Miguel ]

    [ Prefixed test suite name with `rust_` as mentioned. Markdown-formatte=
d
      a few comments with Markdown. - Miguel ]

Cheers,
Miguel
