Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF37369D5E
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 13:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786626974; cv=none; b=eU7/CkLVN7/YlRxMNmpvcMvKh3ckwyFBEbJgEnl+/6o8Y6Kn5cskcnLATaVI2yNx2lx7LOgcnVmhWx3HSqofobLTyku1siniLllCFPEsOn9DJHSGc4O/hl6QhHqR2w6+lPxxwtppwTo1/qoeyt7gIbFWF9L4a4ztGktG1CimIaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786626974; c=relaxed/simple;
	bh=q6LyvJKlzkRgT7RDVr8xqWTWtDJxhF2YDVk8B+GLHaM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=FX6QKQdlPixHsSdq3hVY4SN14G1HEdLUDpJQ+IxyrTfT47qM0ho2eb6OoJygCM/VU9BeEBXFYJ7tLCjRubK09D77ULJOGr7Nc1T8sBoZwAyaftMcFHHdS/yegqHH1kGAVpxzJ3z+Bzh8oqSKGP38aNDl+1Nl0Nxqo6hw/I7Sp2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me; spf=pass smtp.mailfrom=rcpassos.me; dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b=QfscOLqO; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=iLAFUQFo; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rcpassos.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b="QfscOLqO";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="iLAFUQFo"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=QfscOLqOqbxquocCIb1ywGHRxMjOhTQJQQk6uLbirwCWVYSv12YsF0Pg6HTmmvXDADgzkZDvIQjGYG0emEYxxGzk5aGv5UUt0AMaFGb+lBrNYFsgMMJ8718hFBSgxdQSvNHSuxaF6WvyDlh5NkbVUZ7NqtIxaN1C1RPU64VATRUTpejsAHWTxWnefUYBHbj+lkNHbG1OOlB/J3GnROoZ3g7Tch41qOa8w3YxNIakC0oZUF3IZlNOzirio0Vi7EOBHqFkYDftSzP3kK6zlIozypZk80cCIA92NJ0wAHh/Pg9qXOhLTVxCZfWBLa19t4io26HvxAol/OVIgQXyPPp2aw==; s=purelymail3; d=rcpassos.me; v=1; bh=q6LyvJKlzkRgT7RDVr8xqWTWtDJxhF2YDVk8B+GLHaM=; h=Received:Date:From:To:Subject;
DKIM-Signature: a=rsa-sha256; b=iLAFUQFon6PrNklAX4fmoug6cIQXTbb9cb5agg5I59umL+0i2oRrdAzgo4RriBILkLujQNJhXnRM7XcpHr19leoNrPomrpcWsO8Vp6xjjdwtgOdyUvhGreYpqrcmBoqC+K5A6nQ5X9LAPEyUbXGz+p05+TPWI7HOhC3SYuWxlmYbv+aqLEpfr3HTX8K0URSIvTNUMtTgOxB+YXSf8o+5xQPPU+0w4pVPzAvCEVLgXxS70PZFhVN+M/keSV09JSNtFLhHOguH8yAk+YLpkNPYt8WQut/iLblv4NMJIJuLNrN9Xj6QRveR+JvD4hAU419/j4ype8Gm9pF7pBXmetBtGw==; s=purelymail3; d=purelymail.com; v=1; bh=q6LyvJKlzkRgT7RDVr8xqWTWtDJxhF2YDVk8B+GLHaM=; h=Feedback-ID:Received:Date:From:To:Subject;
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: rust-for-linux@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 968025504;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 13 Aug 2026 13:16:03 +0000 (UTC)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Aug 2026 10:15:46 -0300
Message-Id: <DKNUE8CVHMBF.2I9WPCF66RLA7@rcpassos.me>
Cc: <oe-kbuild-all@lists.linux.dev>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Brigham Campbell" <me@brighamcampbell.com>,
 "Jori Koolstra" <jkoolstra@xs4all.nl>
From: "Rafael Passos" <rafael@rcpassos.me>
To: "kernel test robot" <lkp@intel.com>, "Rafael Passos"
 <rafael@rcpassos.me>, <rust-for-linux@vger.kernel.org>,
 <aliceryhl@google.com>, <gregkh@linuxfoundation.org>, <arve@android.com>,
 <tkjos@android.com>, "Christian Brauner" <brauner@kernel.org>,
 <cmllamas@google.com>
Subject: Re: [PATCH v2] rust_binder: speed up get_node_debug_info using
 lower_bound iter
X-Mailer: aerc 0.22.0
References: <20260731133253.661634-1-rafael@rcpassos.me>
 <202608102134.Dygd1Kx3-lkp@intel.com>
In-Reply-To: <202608102134.Dygd1Kx3-lkp@intel.com>

Hi Alice,

Do you want me to send a v3 with this rustfmt change ?

On Mon Aug 10, 2026 at 4:29 PM -03, kernel test robot wrote:
> ...
>             {
>                 let inner =3D self.inner.lock();
>                 // cursor_lower_bound retrieves the "key" passed or the n=
ext existing larger key
>    -            if let Some(cursor) =3D inner.nodes.cursor_lower_bound(&(=
ptr+1)){
>    +            if let Some(cursor) =3D inner.nodes.cursor_lower_bound(&(=
ptr + 1)) {
>                     let (_, node) =3D cursor.current();

Thanks,
Rafael Passos
